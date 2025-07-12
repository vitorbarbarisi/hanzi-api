# 🚀 Auto-Start Configuration for Hanzi API

Este diretório contém scripts para configurar o auto-start do Hanzi API usando systemd no Linux.

## 📋 Pré-requisitos

- ✅ Sistema Linux com systemd
- ✅ Docker instalado e rodando
- ✅ Docker Compose instalado (v1 ou v2)
- ✅ Permissões sudo

## 🐳 Compatibilidade Docker Compose

O script **detecta automaticamente** e funciona com:

- **Docker Compose v2** (integrado): `docker compose`
- **Docker Compose v1** (standalone): `docker-compose`

### Instalação Docker Compose:

```bash
# Opção 1: Docker Compose v2 (recomendado)
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Opção 2: Docker Compose standalone
sudo apt install docker-compose

# Opção 3: Via pip
pip install docker-compose

# Opção 4: Download direto
curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

## 🔧 Instalação

### 1. Executar o script de instalação:

```bash
./install_autostart.sh
```

### 2. O script irá:

- ✅ Verificar pré-requisitos
- ✅ **Detectar automaticamente** `docker compose` ou `docker-compose`
- ✅ Criar serviço systemd otimizado
- ✅ Habilitar auto-start
- ✅ Opcionalmente iniciar o serviço agora

## 🎮 Comandos Úteis

### Gerenciamento do Serviço:
```bash
# Ver status
sudo systemctl status hanzi-api

# Iniciar serviço
sudo systemctl start hanzi-api

# Parar serviço
sudo systemctl stop hanzi-api

# Reiniciar serviço
sudo systemctl restart hanzi-api

# Ver logs em tempo real
sudo journalctl -u hanzi-api -f
```

### Verificação:
```bash
# Verificar se está habilitado
systemctl is-enabled hanzi-api

# Verificar se está ativo
systemctl is-active hanzi-api

# Ver containers rodando
docker ps

# Verificar qual versão do Compose está sendo usada
docker compose version || docker-compose --version
```

## 🗑️ Desinstalação

Para remover o auto-start:

```bash
./uninstall_autostart.sh
```

## 📁 Arquivos Criados

- `/etc/systemd/system/hanzi-api.service` - Arquivo de serviço systemd

## 🔍 Solução de Problemas

### Serviço não inicia:
```bash
# Verificar logs
sudo journalctl -u hanzi-api -n 50

# Verificar se Docker está rodando
sudo systemctl status docker

# Verificar se arquivo compose existe
ls -la docker-compose.yml

# Testar comando manualmente
docker compose up -d || docker-compose up -d
```

### Docker Compose não encontrado:
```bash
# Verificar instalação
docker compose version
docker-compose --version

# Verificar PATH
echo $PATH
which docker-compose
```

### Resetar serviço:
```bash
# Parar serviço
sudo systemctl stop hanzi-api

# Desabilitar
sudo systemctl disable hanzi-api

# Recarregar systemd
sudo systemctl daemon-reload

# Reinstalar
./install_autostart.sh
```

## 🌟 Features

- **✅ Auto-start**: Inicia automaticamente no boot
- **✅ Detecção automática**: Funciona com `docker compose` e `docker-compose`
- **✅ Logs**: Integrado com journald
- **✅ Robusto**: Aguarda Docker estar disponível
- **✅ Seguro**: Roda com usuário não-root
- **✅ Timeouts**: Configurado com timeouts apropriados
- **✅ Reload**: Suporte a restart do serviço

## 📝 Notas

- O script detecta automaticamente qual versão do Docker Compose usar
- O serviço aguarda o Docker estar disponível antes de iniciar
- Todos os logs são enviados para journald
- O serviço roda com as permissões do usuário atual
- Timeouts de 5 minutos para start/stop
- Compatível com Docker Compose v1 e v2

## 🆘 Suporte

Se encontrar problemas:

1. Verifique os logs: `sudo journalctl -u hanzi-api -f`
2. Verifique se Docker está rodando: `docker ps`
3. Verifique se o arquivo compose existe: `ls -la docker-compose.yml`
4. Teste manualmente: `docker compose up -d` ou `docker-compose up -d`
5. Verifique qual versão do Compose está instalada: `docker compose version || docker-compose --version` 