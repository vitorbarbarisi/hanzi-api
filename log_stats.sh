#!/bin/bash

# Log Statistics Script
# Mostra estatísticas detalhadas sobre uso de logs no sistema

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}━━━ $1 ━━━${NC}"
}

print_subheader() {
    echo -e "${CYAN}▶ $1${NC}"
}

print_metric() {
    echo -e "  ${GREEN}$1:${NC} $2"
}

print_warning() {
    echo -e "  ${YELLOW}⚠️ $1${NC}"
}

print_error() {
    echo -e "  ${RED}❌ $1${NC}"
}

# Função para formatar bytes
format_bytes() {
    local bytes=$1
    if [ $bytes -lt 1024 ]; then
        echo "${bytes}B"
    elif [ $bytes -lt 1048576 ]; then
        echo "$(($bytes / 1024))KB"
    elif [ $bytes -lt 1073741824 ]; then
        echo "$(($bytes / 1048576))MB"
    else
        echo "$(($bytes / 1073741824))GB"
    fi
}

# Função para verificar se comando existe
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

clear
echo ""
print_header "📊 HANZI API - ESTATÍSTICAS DE LOGS"
echo "Gerado em: $(date)"
echo ""

# 1. Informações do Sistema
print_header "🖥️ INFORMAÇÕES DO SISTEMA"
echo ""

print_metric "Sistema Operacional" "$(uname -s) $(uname -r)"
print_metric "Hostname" "$(hostname)"
print_metric "Uptime" "$(uptime -p)"

# Espaço em disco
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
DISK_AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
print_metric "Uso de disco raiz" "$DISK_USAGE (${DISK_AVAILABLE} disponível)"

if [ "${DISK_USAGE%?}" -gt 80 ]; then
    print_warning "Uso de disco acima de 80%!"
fi

echo ""

# 2. Estatísticas do Journald
print_header "📰 JOURNALD (SYSTEMD LOGS)"
echo ""

if command_exists journalctl; then
    # Uso de disco do journald
    JOURNAL_USAGE=$(journalctl --disk-usage 2>/dev/null | grep -o '[0-9.]*[KMGT]B')
    print_metric "Uso de disco" "$JOURNAL_USAGE"
    
    # Configuração atual
    if [ -f /etc/systemd/journald.conf ]; then
        MAX_USE=$(grep "SystemMaxUse" /etc/systemd/journald.conf 2>/dev/null | cut -d'=' -f2)
        MAX_FILE=$(grep "SystemMaxFileSize" /etc/systemd/journald.conf 2>/dev/null | cut -d'=' -f2)
        RETENTION=$(grep "MaxRetentionSec" /etc/systemd/journald.conf 2>/dev/null | cut -d'=' -f2)
        
        print_metric "Limite máximo configurado" "${MAX_USE:-Padrão}"
        print_metric "Tamanho máximo por arquivo" "${MAX_FILE:-Padrão}"
        print_metric "Retenção configurada" "${RETENTION:-Padrão}"
    fi
    
    # Logs do hanzi-api
    if systemctl list-units --type=service | grep -q hanzi-api; then
        print_subheader "Logs do Hanzi API"
        
        # Últimas 24 horas
        LOGS_24H=$(journalctl -u hanzi-api --since "24 hours ago" --no-pager -q | wc -l)
        print_metric "Entradas últimas 24h" "$LOGS_24H"
        
        # Última execução
        LAST_LOG=$(journalctl -u hanzi-api -n 1 --no-pager -o short-iso-precise 2>/dev/null | tail -1)
        if [ -n "$LAST_LOG" ]; then
            LAST_TIME=$(echo "$LAST_LOG" | awk '{print $1, $2}')
            print_metric "Último log" "$LAST_TIME"
        fi
        
        # Status do serviço
        if systemctl is-active --quiet hanzi-api; then
            print_metric "Status do serviço" "🟢 Ativo"
        else
            print_metric "Status do serviço" "🔴 Inativo"
        fi
    else
        print_warning "Serviço hanzi-api não encontrado"
    fi
else
    print_error "journalctl não disponível"
fi

echo ""

# 3. Estatísticas do Docker
print_header "🐳 DOCKER LOGS"
echo ""

if command_exists docker; then
    # Verificar se Docker está rodando
    if docker info >/dev/null 2>&1; then
        # Uso de disco do Docker
        DOCKER_USAGE=$(docker system df 2>/dev/null)
        if [ -n "$DOCKER_USAGE" ]; then
            echo "$DOCKER_USAGE" | while IFS= read -r line; do
                if echo "$line" | grep -q "Local Volumes"; then
                    SIZE=$(echo "$line" | awk '{print $3}')
                    print_metric "Volumes" "$SIZE"
                elif echo "$line" | grep -q "Build Cache"; then
                    SIZE=$(echo "$line" | awk '{print $3}')
                    print_metric "Build Cache" "$SIZE"
                fi
            done
        fi
        
        # Containers em execução
        RUNNING_CONTAINERS=$(docker ps --format "table {{.Names}}" | tail -n +2 | wc -l)
        print_metric "Containers rodando" "$RUNNING_CONTAINERS"
        
        # Configuração de log
        print_subheader "Configuração de Logging"
        
        if [ -f /etc/docker/daemon.json ]; then
            LOG_DRIVER=$(grep -o '"log-driver"[^,]*' /etc/docker/daemon.json 2>/dev/null | cut -d'"' -f4)
            MAX_SIZE=$(grep -o '"max-size"[^,]*' /etc/docker/daemon.json 2>/dev/null | cut -d'"' -f4)
            MAX_FILE=$(grep -o '"max-file"[^,]*' /etc/docker/daemon.json 2>/dev/null | cut -d'"' -f4)
            
            print_metric "Driver de log" "${LOG_DRIVER:-json-file}"
            print_metric "Tamanho máximo" "${MAX_SIZE:-10m}"
            print_metric "Arquivos máximos" "${MAX_FILE:-3}"
        else
            print_warning "Configuração /etc/docker/daemon.json não encontrada"
        fi
        
        # Verificar containers do Hanzi API
        print_subheader "Containers Hanzi API"
        
        HANZI_CONTAINERS=$(docker ps --format "{{.Names}}" | grep -E "(hanzi|postgres|pgadmin)" | head -5)
        if [ -n "$HANZI_CONTAINERS" ]; then
            echo "$HANZI_CONTAINERS" | while read -r container; do
                if [ -n "$container" ]; then
                    STATUS=$(docker inspect --format='{{.State.Status}}' "$container" 2>/dev/null)
                    STARTED=$(docker inspect --format='{{.State.StartedAt}}' "$container" 2>/dev/null | cut -d'T' -f1)
                    print_metric "$container" "🟢 $STATUS (desde $STARTED)"
                fi
            done
        else
            print_warning "Nenhum container relacionado ao Hanzi API encontrado"
        fi
        
    else
        print_error "Docker não está rodando"
    fi
else
    print_error "Docker não instalado"
fi

echo ""

# 4. Logs de Aplicação
print_header "📝 LOGS DE APLICAÇÃO"
echo ""

# Verificar diretórios de log
LOG_DIRS=("/var/log/hanzi-api" "$HOME/hanzi-api/logs" "/var/log")

for dir in "${LOG_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        LOG_FILES=$(find "$dir" -name "*.log" 2>/dev/null | wc -l)
        if [ $LOG_FILES -gt 0 ]; then
            TOTAL_SIZE=$(find "$dir" -name "*.log" -exec ls -ln {} \; 2>/dev/null | awk '{sum += $5} END {print sum+0}')
            FORMATTED_SIZE=$(format_bytes $TOTAL_SIZE)
            print_metric "$dir" "$LOG_FILES arquivos ($FORMATTED_SIZE)"
            
            # Mostrar arquivos maiores
            LARGE_FILES=$(find "$dir" -name "*.log" -size +10M 2>/dev/null)
            if [ -n "$LARGE_FILES" ]; then
                echo "$LARGE_FILES" | while read -r file; do
                    if [ -n "$file" ]; then
                        SIZE=$(ls -lh "$file" 2>/dev/null | awk '{print $5}')
                        print_warning "Arquivo grande: $(basename "$file") ($SIZE)"
                    fi
                done
            fi
        fi
    fi
done

# Log de limpeza
if [ -f /var/log/hanzi-api-cleanup.log ]; then
    print_subheader "Log de Limpeza Automática"
    
    LAST_CLEANUP=$(tail -1 /var/log/hanzi-api-cleanup.log 2>/dev/null)
    if [ -n "$LAST_CLEANUP" ]; then
        print_metric "Última limpeza" "$LAST_CLEANUP"
    fi
    
    CLEANUP_COUNT=$(grep -c "Limpeza concluída" /var/log/hanzi-api-cleanup.log 2>/dev/null)
    print_metric "Limpezas executadas" "$CLEANUP_COUNT"
fi

echo ""

# 5. Configurações de Rotação
print_header "🔄 CONFIGURAÇÕES DE ROTAÇÃO"
echo ""

print_subheader "Logrotate"
if [ -f /etc/logrotate.d/hanzi-api ]; then
    print_metric "Configuração" "✅ /etc/logrotate.d/hanzi-api"
    
    # Verificar última execução do logrotate
    if [ -f /var/lib/logrotate/logrotate.status ]; then
        LAST_ROTATION=$(grep hanzi-api /var/lib/logrotate/logrotate.status 2>/dev/null | awk '{print $2}')
        if [ -n "$LAST_ROTATION" ]; then
            print_metric "Última rotação" "$LAST_ROTATION"
        fi
    fi
else
    print_warning "Configuração logrotate não encontrada"
fi

print_subheader "Cron Jobs"
if [ -f /etc/cron.d/hanzi-api-cleanup ]; then
    print_metric "Cron de limpeza" "✅ /etc/cron.d/hanzi-api-cleanup"
    
    # Próxima execução (aproximada)
    NEXT_RUN="Hoje às 02:00 (estimativa)"
    print_metric "Próxima execução" "$NEXT_RUN"
else
    print_warning "Cron de limpeza não configurado"
fi

# Script de limpeza
if [ -f /usr/local/bin/hanzi-api-cleanup ]; then
    print_metric "Script de limpeza" "✅ /usr/local/bin/hanzi-api-cleanup"
else
    print_warning "Script de limpeza não encontrado"
fi

echo ""

# 6. Resumo e Recomendações
print_header "💡 RESUMO E RECOMENDAÇÕES"
echo ""

# Calcular uso total estimado de logs
TOTAL_USAGE=0

# Adicionar uso do journald (estimativa)
if [ -n "$JOURNAL_USAGE" ]; then
    JOURNAL_MB=$(echo "$JOURNAL_USAGE" | sed 's/[^0-9.]//g')
    TOTAL_USAGE=$(echo "$TOTAL_USAGE + $JOURNAL_MB" | bc 2>/dev/null || echo $TOTAL_USAGE)
fi

print_metric "Uso estimado total de logs" "~${TOTAL_USAGE}MB"

# Recomendações baseadas no que foi encontrado
if [ "${DISK_USAGE%?}" -gt 80 ]; then
    print_warning "Disco quase cheio - considere limpeza manual"
fi

if ! systemctl is-active --quiet hanzi-api 2>/dev/null; then
    print_warning "Serviço hanzi-api não está rodando"
fi

if [ ! -f /etc/cron.d/hanzi-api-cleanup ]; then
    print_warning "Configure limpeza automática executando: ./configure_log_rotation.sh"
fi

echo ""
print_header "🎮 COMANDOS ÚTEIS"
echo ""
echo "  📊 Ver uso detalhado:     journalctl --disk-usage"
echo "  🧹 Limpeza manual:       sudo /usr/local/bin/hanzi-api-cleanup"
echo "  📋 Logs em tempo real:   journalctl -u hanzi-api -f"
echo "  🐳 Logs Docker:          docker compose logs -f"
echo "  💾 Espaço em disco:      df -h"
echo "  🔍 Testar logrotate:     sudo logrotate -d /etc/logrotate.d/hanzi-api"
echo ""

print_header "📈 ESTATÍSTICAS COLETADAS EM: $(date)" 