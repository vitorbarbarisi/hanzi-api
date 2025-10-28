# OpenAI API Configuration Guide

## 🔑 Como configurar a chave da API OpenAI

Sua aplicação precisa de uma chave da API OpenAI para funcionar corretamente com o recurso de enriquecimento de caracteres hanzi.

### Passo 1: Obter a chave da API OpenAI

1. Acesse: https://platform.openai.com/api-keys
2. Faça login ou crie uma conta OpenAI
3. Clique em "Create new secret key"
4. Copie a chave gerada (ela começa com `sk-`)

### Passo 2: Configurar no projeto

#### Opção A: Usando arquivo .env (Recomendado)

1. Crie um arquivo `.env` na raiz do projeto:
```bash
cp env.template .env
```

2. Edite o arquivo `.env` e substitua `your_openai_api_key_here` pela sua chave real:
```bash
OPENAI_API_KEY=sk-sua-chave-aqui
```

#### Opção B: Definir diretamente no sistema

```bash
export OPENAI_API_KEY=sk-sua-chave-aqui
```

### Passo 3: Reiniciar a aplicação

```bash
# Parar os containers
docker-compose down

# Iniciar novamente (carregará as novas variáveis)
docker-compose up -d
```

### Verificar se funcionou

Teste o endpoint de enriquecimento:
```bash
curl -X PUT "http://localhost:7998/hanzi-api/hanzi/過/enrich"
```

O erro "OpenAI API key not found" não deve mais aparecer nos logs.

## 💰 Custos

- O modelo usado é `gpt-4o-mini` (mais barato)
- Custo estimado: ~$0.001 por requisição
- Configure limites de billing na OpenAI se necessário

## 🔒 Segurança

- ❌ **NUNCA** commite a chave no Git
- ✅ O arquivo `.env` está no `.gitignore`
- ✅ Use variáveis de ambiente em produção
