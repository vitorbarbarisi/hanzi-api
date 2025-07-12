#!/bin/bash

# Docker Compose Test Script
# Este script verifica se o Docker Compose está funcionando corretamente

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
    echo -e "${BLUE}[TEST]${NC} $1"
}

# Função para detectar comando Docker Compose
detect_docker_compose() {
    if command -v docker &> /dev/null && docker compose version &> /dev/null; then
        echo "docker compose"
    elif command -v docker-compose &> /dev/null; then
        echo "docker-compose"
    else
        echo ""
    fi
}

echo ""
print_header "🧪 Testando Docker Compose Installation"
echo ""

# Teste 1: Verificar se Docker está instalado
print_header "1. Verificando Docker..."
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    print_status "✅ Docker encontrado: $DOCKER_VERSION"
else
    print_error "❌ Docker não encontrado"
    echo "   Instale com: sudo apt install docker.io"
    exit 1
fi

# Teste 2: Verificar se Docker está rodando
print_header "2. Verificando se Docker está rodando..."
if docker info &> /dev/null; then
    print_status "✅ Docker está rodando"
else
    print_error "❌ Docker não está rodando"
    echo "   Inicie com: sudo systemctl start docker"
    exit 1
fi

# Teste 3: Detectar Docker Compose
print_header "3. Detectando Docker Compose..."
DOCKER_COMPOSE_CMD=$(detect_docker_compose)

if [ -z "$DOCKER_COMPOSE_CMD" ]; then
    print_error "❌ Docker Compose não encontrado"
    echo ""
    echo "Instale uma das opções:"
    echo "  1. Docker Compose v2: sudo apt install docker-compose-plugin"
    echo "  2. Docker Compose v1: sudo apt install docker-compose"
    echo "  3. Via pip: pip install docker-compose"
    exit 1
else
    print_status "✅ Docker Compose encontrado: $DOCKER_COMPOSE_CMD"
fi

# Teste 4: Verificar versão
print_header "4. Verificando versão..."
if [ "$DOCKER_COMPOSE_CMD" = "docker compose" ]; then
    COMPOSE_VERSION=$(docker compose version)
    print_status "✅ Versão: $COMPOSE_VERSION"
else
    COMPOSE_VERSION=$(docker-compose --version)
    print_status "✅ Versão: $COMPOSE_VERSION"
fi

# Teste 5: Verificar se docker-compose.yml existe
print_header "5. Verificando docker-compose.yml..."
if [ -f "docker-compose.yml" ]; then
    print_status "✅ docker-compose.yml encontrado"
else
    print_error "❌ docker-compose.yml não encontrado no diretório atual"
    echo "   Navegue para o diretório do projeto primeiro"
    exit 1
fi

# Teste 6: Validar docker-compose.yml
print_header "6. Validando docker-compose.yml..."
if [ "$DOCKER_COMPOSE_CMD" = "docker compose" ]; then
    if docker compose config > /dev/null 2>&1; then
        print_status "✅ docker-compose.yml é válido"
    else
        print_error "❌ docker-compose.yml tem erros"
        docker compose config
        exit 1
    fi
else
    if docker-compose config > /dev/null 2>&1; then
        print_status "✅ docker-compose.yml é válido"
    else
        print_error "❌ docker-compose.yml tem erros"
        docker-compose config
        exit 1
    fi
fi

# Teste 7: Verificar se há conflitos de porta
print_header "7. Verificando conflitos de porta..."
PORTS=$(grep -E "^\s*-\s*[\"']?[0-9]+:[0-9]+" docker-compose.yml | sed 's/.*"\([0-9]*\):.*/\1/' | sed 's/.*\([0-9]*\):.*/\1/')
CONFLICTS=0

for PORT in $PORTS; do
    if ss -tuln | grep -q ":$PORT "; then
        print_warning "⚠️ Porta $PORT já está em uso"
        CONFLICTS=$((CONFLICTS + 1))
    else
        print_status "✅ Porta $PORT disponível"
    fi
done

if [ $CONFLICTS -gt 0 ]; then
    print_warning "⚠️ Há $CONFLICTS conflito(s) de porta"
    echo "   Você pode precisar parar outros serviços"
fi

# Teste 8: Teste de execução (dry run)
print_header "8. Testando execução (dry run)..."
echo "Executando: $DOCKER_COMPOSE_CMD config --services"
if [ "$DOCKER_COMPOSE_CMD" = "docker compose" ]; then
    SERVICES=$(docker compose config --services)
else
    SERVICES=$(docker-compose config --services)
fi

if [ -n "$SERVICES" ]; then
    print_status "✅ Serviços encontrados:"
    echo "$SERVICES" | sed 's/^/     - /'
else
    print_error "❌ Nenhum serviço encontrado"
    exit 1
fi

# Resumo final
echo ""
print_header "📊 Resumo do Teste"
echo ""
print_status "✅ Docker: OK"
print_status "✅ Docker Compose: $DOCKER_COMPOSE_CMD"
print_status "✅ Configuração: Válida"
print_status "✅ Serviços: $(echo "$SERVICES" | wc -l)"

if [ $CONFLICTS -gt 0 ]; then
    print_warning "⚠️ Conflitos de porta: $CONFLICTS"
fi

echo ""
print_status "🎉 Todos os testes passaram!"
print_status "Você pode executar o script de instalação:"
echo "   ./install_autostart.sh"
echo ""
print_status "Ou testar manualmente:"
echo "   $DOCKER_COMPOSE_CMD up -d" 