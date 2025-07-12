#!/bin/bash

# Configure Log Rotation and Cleanup Script
# Este script configura rotação automática de logs para Docker, systemd e aplicação

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para imprimir mensagens coloridas
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}[CONFIG]${NC} $1"
}

# Verificar se está executando como root
if [[ $EUID -eq 0 ]]; then
   print_error "Este script não deve ser executado como root. Execute sem sudo."
   exit 1
fi

echo ""
print_header "🗂️ Configurando Rotação e Limpeza de Logs"
echo ""

# 1. Configurar rotação de logs do journald (systemd)
print_header "1. Configurando journald (systemd logs)..."

JOURNALD_CONFIG="/etc/systemd/journald.conf"
JOURNALD_BACKUP="/etc/systemd/journald.conf.backup"

# Fazer backup da configuração original
if [ ! -f "$JOURNALD_BACKUP" ]; then
    print_status "Criando backup da configuração journald..."
    sudo cp "$JOURNALD_CONFIG" "$JOURNALD_BACKUP"
fi

# Configurar journald com limites apropriados
print_status "Configurando limites do journald..."
sudo tee /tmp/journald.conf > /dev/null <<EOF
[Journal]
# Armazenar logs apenas na memória + disco
Storage=persistent

# Tamanho máximo dos logs no disco (100MB)
SystemMaxUse=100M

# Tamanho máximo de um arquivo de log (10MB)
SystemMaxFileSize=10M

# Manter logs por no máximo 30 dias
MaxRetentionSec=30d

# Comprimir logs antigos
Compress=yes

# Rotacionar logs diariamente
MaxFileSec=1day

# Limitar logs em runtime (50MB)
RuntimeMaxUse=50M
RuntimeMaxFileSize=5M
EOF

sudo mv /tmp/journald.conf "$JOURNALD_CONFIG"
print_status "✅ Configuração journald atualizada"

# 2. Configurar rotação de logs do Docker
print_header "2. Configurando Docker log rotation..."

DOCKER_DAEMON_CONFIG="/etc/docker/daemon.json"
DOCKER_DAEMON_BACKUP="/etc/docker/daemon.json.backup"

# Fazer backup se arquivo existe
if [ -f "$DOCKER_DAEMON_CONFIG" ]; then
    sudo cp "$DOCKER_DAEMON_CONFIG" "$DOCKER_DAEMON_BACKUP"
fi

# Criar configuração do Docker com rotação de logs
print_status "Configurando rotação de logs do Docker..."
sudo tee /tmp/docker-daemon.json > /dev/null <<EOF
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "5",
    "compress": "true"
  },
  "storage-driver": "overlay2"
}
EOF

sudo mkdir -p /etc/docker
sudo mv /tmp/docker-daemon.json "$DOCKER_DAEMON_CONFIG"
print_status "✅ Configuração Docker atualizada"

# 3. Configurar logrotate para logs personalizados
print_header "3. Configurando logrotate..."

LOGROTATE_CONFIG="/etc/logrotate.d/hanzi-api"

sudo tee /tmp/hanzi-api-logrotate > /dev/null <<EOF
# Rotação de logs para Hanzi API
/var/log/hanzi-api/*.log {
    daily
    missingok
    rotate 7
    compress
    delaycompress
    notifempty
    copytruncate
    maxage 30
    su root root
}

# Logs de aplicação Python
/home/*/hanzi-api/logs/*.log {
    daily
    missingok
    rotate 7
    compress
    delaycompress
    notifempty
    copytruncate
    maxage 30
    su $USER $USER
}
EOF

sudo mv /tmp/hanzi-api-logrotate "$LOGROTATE_CONFIG"
print_status "✅ Configuração logrotate criada"

# 4. Criar script de limpeza automática
print_header "4. Criando script de limpeza automática..."

CLEANUP_SCRIPT="/usr/local/bin/hanzi-api-cleanup"

sudo tee /tmp/hanzi-cleanup.sh > /dev/null <<'EOF'
#!/bin/bash

# Hanzi API Log Cleanup Script
# Remove logs antigos e limpa espaço em disco

LOG_FILE="/var/log/hanzi-api-cleanup.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

log_message() {
    echo "[$DATE] $1" >> "$LOG_FILE"
}

log_message "Iniciando limpeza de logs..."

# Limpar logs do Docker antigos (mais de 30 dias)
find /var/lib/docker/containers -name "*.log" -type f -mtime +30 -delete 2>/dev/null || true
DELETED_DOCKER=$(find /var/lib/docker/containers -name "*.log" -type f -mtime +30 2>/dev/null | wc -l)
log_message "Removidos $DELETED_DOCKER arquivos de log do Docker"

# Limpar logs do journald antigos
journalctl --vacuum-time=30d --quiet
journalctl --vacuum-size=100M --quiet
log_message "Logs do journald limpos (mantendo 30 dias e 100MB)"

# Limpar logs de aplicação antigos
find /home/*/hanzi-api/logs -name "*.log" -type f -mtime +30 -delete 2>/dev/null || true
find /var/log/hanzi-api -name "*.log" -type f -mtime +30 -delete 2>/dev/null || true

# Limpar arquivos de log comprimidos antigos
find /var/log -name "*.gz" -type f -mtime +60 -delete 2>/dev/null || true

# Mostrar uso de disco atual
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
log_message "Uso de disco atual: $DISK_USAGE"

log_message "Limpeza concluída"
EOF

sudo mv /tmp/hanzi-cleanup.sh "$CLEANUP_SCRIPT"
sudo chmod +x "$CLEANUP_SCRIPT"
print_status "✅ Script de limpeza criado em $CLEANUP_SCRIPT"

# 5. Configurar cron para execução automática
print_header "5. Configurando execução automática (cron)..."

CRON_FILE="/etc/cron.d/hanzi-api-cleanup"

sudo tee /tmp/hanzi-cron > /dev/null <<EOF
# Hanzi API Log Cleanup Cron Job
# Executa limpeza diariamente às 2:00 AM
0 2 * * * root $CLEANUP_SCRIPT >/dev/null 2>&1

# Executa logrotate para garantir rotação
30 2 * * * root /usr/sbin/logrotate -f /etc/logrotate.d/hanzi-api >/dev/null 2>&1
EOF

sudo mv /tmp/hanzi-cron "$CRON_FILE"
sudo chmod 644 "$CRON_FILE"
print_status "✅ Cron job configurado para execução diária às 2:00 AM"

# 6. Criar diretório de logs se não existir
print_header "6. Criando estrutura de diretórios..."

sudo mkdir -p /var/log/hanzi-api
mkdir -p "$HOME/hanzi-api/logs" 2>/dev/null || true
print_status "✅ Diretórios de log criados"

# 7. Configurar docker-compose.yml para usar log rotation
print_header "7. Verificando configuração do docker-compose.yml..."

if [ -f "docker-compose.yml" ]; then
    if ! grep -q "logging:" docker-compose.yml; then
        print_warning "⚠️ docker-compose.yml não tem configuração de logging"
        echo ""
        echo "Adicione esta configuração aos seus serviços no docker-compose.yml:"
        echo ""
        echo "logging:"
        echo "  driver: \"json-file\""
        echo "  options:"
        echo "    max-size: \"10m\""
        echo "    max-file: \"5\""
        echo "    compress: \"true\""
        echo ""
    else
        print_status "✅ docker-compose.yml já tem configuração de logging"
    fi
else
    print_warning "⚠️ docker-compose.yml não encontrado no diretório atual"
fi

# Reiniciar serviços se necessário
echo ""
read -p "Deseja reiniciar os serviços agora para aplicar as configurações? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_status "Reiniciando serviços..."
    
    # Reiniciar journald
    sudo systemctl restart systemd-journald
    print_status "✅ systemd-journald reiniciado"
    
    # Reiniciar Docker
    sudo systemctl restart docker
    print_status "✅ Docker reiniciado"
    
    # Reiniciar hanzi-api se estiver rodando
    if systemctl is-active --quiet hanzi-api.service; then
        sudo systemctl restart hanzi-api.service
        print_status "✅ hanzi-api reiniciado"
    fi
fi

# Mostrar resumo
echo ""
print_header "📊 Resumo da Configuração"
echo ""
print_status "✅ Journald: Logs limitados a 100MB, rotação diária, retenção 30 dias"
print_status "✅ Docker: Logs limitados a 10MB por arquivo, máximo 5 arquivos"
print_status "✅ Logrotate: Rotação diária, compressão automática"
print_status "✅ Limpeza automática: Execução diária às 2:00 AM"
print_status "✅ Cron: Configurado para manutenção automática"

echo ""
print_header "🎮 Comandos Úteis"
echo ""
echo "  📊 Ver uso de logs:        journalctl --disk-usage"
echo "  🧹 Limpeza manual:         sudo $CLEANUP_SCRIPT"
echo "  📋 Ver logs cleanup:       tail -f /var/log/hanzi-api-cleanup.log"
echo "  🗂️ Testar logrotate:       sudo logrotate -f /etc/logrotate.d/hanzi-api"
echo "  📈 Ver espaço em disco:    df -h"
echo "  🔍 Ver logs do journald:   journalctl -u hanzi-api --since today"

echo ""
print_status "🎉 Configuração de rotação de logs concluída!"
print_warning "Os logs agora serão automaticamente rotacionados e limpos." 