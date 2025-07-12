#!/bin/bash

# Update Docker Compose Logging Configuration
# Este script adiciona configurações de logging ao docker-compose.yml

set -e

# Cores para output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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
    echo -e "${BLUE}[UPDATE]${NC} $1"
}

echo ""
print_header "🐳 Atualizando Docker Compose com Configuração de Logging"
echo ""

# Verificar se docker-compose.yml existe
if [ ! -f "docker-compose.yml" ]; then
    print_error "❌ docker-compose.yml não encontrado no diretório atual"
    exit 1
fi

# Fazer backup do arquivo original
BACKUP_FILE="docker-compose.yml.backup.$(date +%Y%m%d_%H%M%S)"
cp docker-compose.yml "$BACKUP_FILE"
print_status "✅ Backup criado: $BACKUP_FILE"

# Verificar se já tem configuração de logging
if grep -q "logging:" docker-compose.yml; then
    print_warning "⚠️ Configuração de logging já existe no docker-compose.yml"
    echo ""
    read -p "Deseja sobrescrever a configuração existente? (y/n): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_status "Operação cancelada"
        exit 0
    fi
fi

print_status "Atualizando docker-compose.yml..."

# Usar Python para atualizar o YAML de forma segura
python3 << 'EOF'
import yaml
import sys

# Configuração de logging padrão
logging_config = {
    'driver': 'json-file',
    'options': {
        'max-size': '10m',
        'max-file': '5',
        'compress': 'true'
    }
}

try:
    # Ler o arquivo docker-compose.yml
    with open('docker-compose.yml', 'r') as file:
        data = yaml.safe_load(file)
    
    # Adicionar configuração de logging a todos os serviços
    if 'services' in data:
        for service_name, service_config in data['services'].items():
            # Pular o serviço base (é um template)
            if service_name == 'base':
                continue
                
            # Adicionar logging configuration
            service_config['logging'] = logging_config
            print(f"✅ Logging configurado para serviço: {service_name}")
    
    # Escrever o arquivo atualizado
    with open('docker-compose.yml', 'w') as file:
        yaml.dump(data, file, default_flow_style=False, sort_keys=False, indent=2)
    
    print("✅ docker-compose.yml atualizado com sucesso!")
    
except Exception as e:
    print(f"❌ Erro ao atualizar docker-compose.yml: {e}")
    sys.exit(1)
EOF

# Verificar se Python executou com sucesso
if [ $? -eq 0 ]; then
    print_status "✅ Configuração de logging adicionada com sucesso!"
    
    echo ""
    print_header "📋 Configuração Aplicada:"
    echo ""
    echo "  📁 Driver: json-file"
    echo "  📏 Tamanho máximo: 10MB por arquivo"
    echo "  📚 Arquivos máximos: 5 por container"
    echo "  🗜️ Compressão: Habilitada"
    
    echo ""
    print_header "🎮 Próximos Passos:"
    echo ""
    echo "1. Reiniciar containers para aplicar nova configuração:"
    echo "   docker compose down && docker compose up -d"
    echo ""
    echo "2. Verificar logs dos containers:"
    echo "   docker compose logs -f"
    echo ""
    echo "3. Verificar tamanho dos logs:"
    echo "   docker system df"
    
else
    print_error "❌ Falha ao atualizar docker-compose.yml"
    print_status "Restaurando backup..."
    cp "$BACKUP_FILE" docker-compose.yml
    print_status "✅ Backup restaurado"
    exit 1
fi

echo ""
read -p "Deseja reiniciar os containers agora para aplicar a nova configuração? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_status "Reiniciando containers..."
    
    # Detectar comando Docker Compose
    if command -v docker &> /dev/null && docker compose version &> /dev/null; then
        DOCKER_COMPOSE_CMD="docker compose"
    elif command -v docker-compose &> /dev/null; then
        DOCKER_COMPOSE_CMD="docker-compose"
    else
        print_error "Docker Compose não encontrado"
        exit 1
    fi
    
    # Parar containers
    $DOCKER_COMPOSE_CMD down
    
    # Iniciar containers com nova configuração
    $DOCKER_COMPOSE_CMD up -d
    
    print_status "✅ Containers reiniciados com nova configuração de logging!"
    
    # Mostrar status
    echo ""
    $DOCKER_COMPOSE_CMD ps
fi

echo ""
print_status "🎉 Configuração de logging do Docker Compose concluída!" 