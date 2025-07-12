# 📊 Log Management - Hanzi API

Documentação completa para gerenciamento, rotação e limpeza automática de logs.

## 📋 Visão Geral

Este sistema implementa uma estratégia completa de gerenciamento de logs para:
- **Systemd/Journald** - Logs do serviço hanzi-api
- **Docker Containers** - Logs dos containers da aplicação
- **Aplicação** - Logs específicos da aplicação FastAPI

## 🗂️ Scripts Disponíveis

| Script | Descrição |
|--------|-----------|
| `configure_log_rotation.sh` | Configuração completa de rotação de logs |
| `update_docker_compose_logging.sh` | Atualiza docker-compose.yml com logging |
| `log_stats.sh` | Mostra estatísticas de uso de logs |

## 🔧 Configuração Automática

### 1. Executar configuração completa:

```bash
# Tornar scripts executáveis
chmod +x configure_log_rotation.sh update_docker_compose_logging.sh

# Configurar rotação de logs do sistema
./configure_log_rotation.sh

# Atualizar docker-compose.yml
./update_docker_compose_logging.sh
```

## 📊 Configurações Aplicadas

### **Journald (Systemd Logs)**
```ini
# /etc/systemd/journald.conf
[Journal]
Storage=persistent
SystemMaxUse=100M          # Max 100MB no disco
SystemMaxFileSize=10M      # Max 10MB por arquivo
MaxRetentionSec=30d        # Manter por 30 dias
Compress=yes              # Comprimir logs antigos
MaxFileSec=1day           # Rotacionar diariamente
RuntimeMaxUse=50M         # Max 50MB em runtime
RuntimeMaxFileSize=5M     # Max 5MB por arquivo runtime
```

### **Docker Daemon**
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",       // Max 10MB por arquivo
    "max-file": "5",         // Max 5 arquivos por container
    "compress": "true"       // Comprimir logs antigos
  }
}
```

### **Docker Compose Services**
```yaml
services:
  hanzi_app:
    # ... outras configurações
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "5"
        compress: "true"
```

### **Logrotate**
```bash
# /etc/logrotate.d/hanzi-api
/var/log/hanzi-api/*.log {
    daily              # Rotacionar diariamente
    missingok          # Não falhar se arquivo não existir
    rotate 7           # Manter 7 backups
    compress           # Comprimir arquivos antigos
    delaycompress      # Comprimir no próximo ciclo
    notifempty         # Não rotacionar se vazio
    copytruncate       # Copiar e truncar arquivo
    maxage 30          # Remover após 30 dias
}
```

## 🕒 Automação (Cron Jobs)

### **Limpeza Diária (2:00 AM)**
```bash
# /etc/cron.d/hanzi-api-cleanup
0 2 * * * root /usr/local/bin/hanzi-api-cleanup >/dev/null 2>&1
30 2 * * * root /usr/sbin/logrotate -f /etc/logrotate.d/hanzi-api >/dev/null 2>&1
```

### **Script de Limpeza**
O script `/usr/local/bin/hanzi-api-cleanup` executa:
- Remove logs Docker > 30 dias
- Limpa journald (vacuum)
- Remove logs de aplicação > 30 dias
- Remove arquivos comprimidos > 60 dias
- Registra estatísticas de uso

## 🎮 Comandos Úteis

### **Verificação de Logs**
```bash
# Ver uso de logs do journald
journalctl --disk-usage

# Ver logs do serviço hanzi-api
journalctl -u hanzi-api --since today

# Ver logs dos containers
docker compose logs -f

# Ver logs de container específico
docker compose logs hanzi_app

# Ver estatísticas de uso do Docker
docker system df
```

### **Limpeza Manual**
```bash
# Executar limpeza manual
sudo /usr/local/bin/hanzi-api-cleanup

# Limpar logs journald manualmente
sudo journalctl --vacuum-time=7d
sudo journalctl --vacuum-size=50M

# Testar logrotate
sudo logrotate -f /etc/logrotate.d/hanzi-api

# Ver logs de limpeza
tail -f /var/log/hanzi-api-cleanup.log
```

### **Monitoramento**
```bash
# Ver espaço em disco
df -h

# Ver tamanho dos logs por tipo
du -sh /var/log/journal/
du -sh /var/lib/docker/containers/
du -sh /var/log/hanzi-api/

# Ver logs em tempo real
journalctl -u hanzi-api -f
docker compose logs -f --tail=50
```

## 📈 Limites e Retenção

| Tipo | Tamanho Máximo | Retenção | Rotação |
|------|----------------|----------|---------|
| **Journald** | 100MB total | 30 dias | Diária |
| **Docker** | 10MB/arquivo, 5 arquivos | ♾️ | Automática |
| **Aplicação** | Sem limite | 30 dias | Diária |
| **Limpeza** | - | - | Diária às 2:00 |

## 🔍 Troubleshooting

### **Logs crescendo muito**
```bash
# Verificar uso atual
journalctl --disk-usage
docker system df

# Limpeza emergencial
sudo journalctl --vacuum-size=10M
docker system prune -f

# Verificar configuração
cat /etc/systemd/journald.conf
cat /etc/docker/daemon.json
```

### **Serviços não rotacionando**
```bash
# Verificar status dos serviços
sudo systemctl status systemd-journald
sudo systemctl status docker
sudo systemctl status cron

# Reiniciar se necessário
sudo systemctl restart systemd-journald
sudo systemctl restart docker
```

### **Cron não executando**
```bash
# Verificar cron jobs
sudo crontab -l
cat /etc/cron.d/hanzi-api-cleanup

# Ver logs do cron
sudo journalctl -u cron -f

# Testar execução manual
sudo /usr/local/bin/hanzi-api-cleanup
```

## 📁 Estrutura de Arquivos

```
/etc/
├── systemd/journald.conf              # Configuração journald
├── docker/daemon.json                 # Configuração Docker
├── logrotate.d/hanzi-api              # Configuração logrotate
└── cron.d/hanzi-api-cleanup           # Cron jobs

/var/log/
├── journal/                           # Logs do journald
├── hanzi-api/                         # Logs da aplicação
└── hanzi-api-cleanup.log              # Logs de limpeza

/usr/local/bin/
└── hanzi-api-cleanup                  # Script de limpeza

/var/lib/docker/containers/            # Logs dos containers
```

## 🛡️ Segurança e Backup

### **Backups Automáticos**
- Configurações originais são sempre backupadas
- Scripts criam backups antes de modificar arquivos
- Logs de sistema são preservados conforme retenção

### **Permissões**
- Scripts executam com usuário não-root
- Operações privilegiadas usam sudo apenas quando necessário
- Arquivos de configuração têm permissões restritivas

### **Monitoramento**
- Logs de limpeza registram todas as operações
- Alertas podem ser configurados para uso excessivo de disco
- Estatísticas são coletadas automaticamente

## 🎯 Melhores Práticas

1. **Monitore regularmente** o uso de disco
2. **Ajuste limites** conforme necessário
3. **Teste scripts** em ambiente de desenvolvimento
4. **Mantenha backups** das configurações
5. **Documente alterações** personalizadas

## 📞 Suporte

Para problemas ou dúvidas:
1. Verifique logs de erro: `journalctl -p err`
2. Execute diagnósticos: `./log_stats.sh`
3. Consulte esta documentação
4. Verifique espaço em disco: `df -h` 