#!/bin/bash

# Hanzi API Auto-Start Uninstall Script
# Este script remove o serviço systemd configurado

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
    print_error "Este script é para sistemas Linux."
    exit 1
fi

# Verificar se systemd está disponível
if ! command -v systemctl &> /dev/null; then
    print_error "systemctl não encontrado. Este sistema não usa systemd."
    exit 1
fi

# Nome do serviço
SERVICE_NAME="hanzi-api"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# Verificar se serviço existe
if [ ! -f "$SERVICE_FILE" ]; then
    print_warning "Serviço ${SERVICE_NAME} não encontrado."
    exit 0
fi

print_status "Removendo serviço ${SERVICE_NAME}..."

# Parar serviço se estiver rodando
if systemctl is-active --quiet "${SERVICE_NAME}.service"; then
    print_status "Parando serviço..."
    sudo systemctl stop "${SERVICE_NAME}.service"
fi

# Desabilitar serviço
print_status "Desabilitando auto-start..."
sudo systemctl disable "${SERVICE_NAME}.service"

# Remover arquivo de serviço
print_status "Removendo arquivo de serviço..."
sudo rm -f "$SERVICE_FILE"

# Recarregar systemd
print_status "Recarregando systemd..."
sudo systemctl daemon-reload

# Resetar falhas
sudo systemctl reset-failed

print_status "✅ Serviço ${SERVICE_NAME} removido com sucesso!"
print_warning "O Docker Compose não será mais iniciado automaticamente no boot." 