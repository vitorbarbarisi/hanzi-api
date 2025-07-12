#!/bin/bash

# Hanzi API Auto-Start Installation Script
# Este script configura o serviço systemd para iniciar automaticamente no boot

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
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

# Verificar se está executando como root
if [[ $EUID -eq 0 ]]; then
   print_error "Este script não deve ser executado como root. Execute sem sudo."
   exit 1
fi

# Detectar sistema operacional
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_error "Este script é para sistemas Linux. No macOS, use launchctl ao invés de systemd."
    echo "Para macOS, consulte: https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html"
    exit 1
fi

# Verificar se systemd está disponível
if ! command -v systemctl &> /dev/null; then
    print_error "systemctl não encontrado. Este sistema não usa systemd."
    exit 1
fi

# Verificar se docker-compose está disponível
if ! command -v docker-compose &> /dev/null; then
    print_error "docker-compose não encontrado. Por favor, instale o Docker Compose primeiro."
    exit 1
fi

# Obter diretório atual do projeto
PROJECT_DIR="$(pwd)"
print_status "Diretório do projeto: $PROJECT_DIR"

# Verificar se docker-compose.yml existe
if [ ! -f "$PROJECT_DIR/docker-compose.yml" ]; then
    print_error "docker-compose.yml não encontrado no diretório atual."
    exit 1
fi

# Verificar se Docker está rodando
if ! docker info &> /dev/null; then
    print_error "Docker não está rodando. Por favor, inicie o Docker primeiro."
    exit 1
fi

# Obter caminho do docker-compose
DOCKER_COMPOSE_PATH=$(which docker-compose)
print_status "Caminho do docker-compose: $DOCKER_COMPOSE_PATH"

# Nome do serviço
SERVICE_NAME="hanzi-api"

# Criar arquivo de serviço temporário
TEMP_SERVICE_FILE="/tmp/${SERVICE_NAME}.service"

print_status "Criando arquivo de serviço..."

cat > "$TEMP_SERVICE_FILE" << EOF
[Unit]
Description=Hanzi API Docker Compose
Documentation=https://github.com/your-repo/hanzi-api
Requires=docker.service
After=docker.service network.target

[Service]
Type=oneshot
RemainAfterExit=yes
WorkingDirectory=$PROJECT_DIR
ExecStart=$DOCKER_COMPOSE_PATH up -d
ExecStop=$DOCKER_COMPOSE_PATH down
ExecReload=$DOCKER_COMPOSE_PATH restart
TimeoutStartSec=300
TimeoutStopSec=300
User=$USER
Group=$USER

[Install]
WantedBy=multi-user.target
EOF

print_status "Arquivo de serviço criado em: $TEMP_SERVICE_FILE"

# Mover arquivo para local correto (precisa de sudo)
print_status "Instalando serviço systemd (requer sudo)..."
sudo mv "$TEMP_SERVICE_FILE" "/etc/systemd/system/${SERVICE_NAME}.service"

# Definir permissões corretas
sudo chmod 644 "/etc/systemd/system/${SERVICE_NAME}.service"

# Recarregar systemd
print_status "Recarregando systemd..."
sudo systemctl daemon-reload

# Habilitar serviço
print_status "Habilitando serviço para auto-start..."
sudo systemctl enable "${SERVICE_NAME}.service"

# Verificar se o serviço foi criado corretamente
print_status "Verificando configuração do serviço..."
if systemctl is-enabled "${SERVICE_NAME}.service" &> /dev/null; then
    print_status "✅ Serviço ${SERVICE_NAME} habilitado com sucesso!"
else
    print_error "❌ Falha ao habilitar serviço ${SERVICE_NAME}"
    exit 1
fi

# Opção de iniciar serviço agora
echo ""
read -p "Deseja iniciar o serviço agora? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_status "Iniciando serviço..."
    sudo systemctl start "${SERVICE_NAME}.service"
    
    # Verificar status
    if systemctl is-active --quiet "${SERVICE_NAME}.service"; then
        print_status "✅ Serviço iniciado com sucesso!"
    else
        print_warning "⚠️ Serviço pode não ter iniciado corretamente."
    fi
fi

# Mostrar comandos úteis
echo ""
print_status "🎉 Instalação concluída!"
echo ""
echo "Comandos úteis:"
echo "  📊 Ver status:           sudo systemctl status ${SERVICE_NAME}"
echo "  🚀 Iniciar serviço:      sudo systemctl start ${SERVICE_NAME}"
echo "  ⏹️  Parar serviço:        sudo systemctl stop ${SERVICE_NAME}"
echo "  🔄 Reiniciar serviço:    sudo systemctl restart ${SERVICE_NAME}"
echo "  📋 Ver logs:             sudo journalctl -u ${SERVICE_NAME} -f"
echo "  ❌ Desabilitar auto-start: sudo systemctl disable ${SERVICE_NAME}"
echo "  🗑️  Remover serviço:      sudo systemctl disable ${SERVICE_NAME} && sudo rm /etc/systemd/system/${SERVICE_NAME}.service"
echo ""
print_status "O serviço irá iniciar automaticamente no próximo boot da VM."
print_warning "Para testar, reinicie a VM com: sudo reboot" 