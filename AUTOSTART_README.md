# 🚀 Auto-Start Configuration for Hanzi API

Este diretório contém scripts para configurar o auto-start do Hanzi API usando systemd no Linux.

## 📋 Pré-requisitos

- ✅ Sistema Linux com systemd
- ✅ Docker instalado e rodando
- ✅ Docker Compose instalado
- ✅ Permissões sudo

## 🔧 Instalação

### 1. Executar o script de instalação:

```bash
./install_autostart.sh
```

### 2. O script irá:

- ✅ Verificar pré-requisitos
- ✅ Criar serviço systemd
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
- **✅ Logs**: Integrado com journald
- **✅ Robusto**: Aguarda Docker estar disponível
- **✅ Seguro**: Roda com usuário não-root
- **✅ Timeouts**: Configurado com timeouts apropriados
- **✅ Reload**: Suporte a restart do serviço

## 📝 Notas

- O serviço aguarda o Docker estar disponível antes de iniciar
- Todos os logs são enviados para journald
- O serviço roda com as permissões do usuário atual
- Timeouts de 5 minutos para start/stop

## 🆘 Suporte

Se encontrar problemas:

1. Verifique os logs: `sudo journalctl -u hanzi-api -f`
2. Verifique se Docker está rodando: `docker ps`
3. Verifique se o arquivo compose existe: `ls -la docker-compose.yml`
4. Teste manualmente: `docker-compose up -d` 