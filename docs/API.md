# HanziAPI — Documentação para IA Codificadora

**Versão:** 0.0.1  
**Ambiente:** `http://localhost:7998`  
**Esquema Completo:** [openapi.json](./openapi.json)

## ⚠️ Conceitos-chave para IA

### Assincronia
- **POST hanzi** e **PUT hanzi/{character}/enrich** disparam background tasks
- Respostas retornam **imediatamente** (201, 202) enquanto o processamento continua
- Para obter dados enriquecidos, **faça polling via GET** após alguns segundos
- Typical enrichment latency: 30-90s (depende do tempo de resposta do DeepSeek + HanziCraft)

### Campos de enriquecimento
| Campo | Preenchido por | Quando | Exemplo |
|-------|--------|--------|---------|
| `meaning` | DeepSeek LLM | após ~30-60s | `愛 (ài) significa 'amor'...` |
| `related_words` | DeepSeek LLM | após ~30-60s | `愛人 - amante\n愛好 - hobby` |
| `decomposition` | DeepSeek LLM | após ~30-60s | `爫 + 冖 + 心 + 夊` |
| `decomposition_meaning` | DeepSeek LLM | após ~30-60s | `Uma mão que segura o coração` |
| `appears_in` | HanziCraft scraper | após ~60-90s | `戀 曖 愛好` |

**Nota:** Se a seção "Appears In" não existe no HanziCraft, o campo permanece vazio.

### Tratamento de erro transparente
- LLM ou scraper falham? Enrich continua, campos vazios permanecem vazios
- Não há exceção — o sistema é resiliente
- Sempre verifique se um campo é `""` antes de usar

---

## 📚 Common Patterns para IA

### 1. Criar hanzi e esperar enriquecimento

```python
# Passo 1: POST (201 - retorna imediatamente)
POST http://localhost:7998/hanzi-api/hanzi
{"character": "愛", "frequency": 200}

→ 201
{
  "character": "愛",
  "frequency": 200,
  "calls": 0,
  "meaning": "",
  "decomposition": "",
  "decomposition_meaning": "",
  "appears_in": "",
  "related_words": ""
}

# Passo 2: Esperar (recomendado: sleep 30s)
time.sleep(30)

# Passo 3: GET para obter dados enriquecidos
GET http://localhost:7998/hanzi-api/hanzi/愛

→ 200
{
  "character": "愛",
  "frequency": 200,
  "calls": 1,
  "meaning": "愛 (ài) significa 'amor'...",
  "decomposition": "爫 + 冖 + 心 + 夊",
  "decomposition_meaning": "Uma mão que segura o coração",
  "appears_in": "戀 曖 愛好",  # ← pode estar vazio se scraper falhou
  "related_words": "愛人 - amante\n愛好 - hobby"
}
```

### 2. Polling com backoff

```python
import time

def wait_for_enrichment(character, max_attempts=5, initial_delay=10):
    """Pooling com backoff exponencial até os dados estarem prontos."""
    delay = initial_delay
    for attempt in range(max_attempts):
        time.sleep(delay)
        response = requests.get(f"http://localhost:7998/hanzi-api/hanzi/{character}")
        
        if response.status_code == 200:
            data = response.json()
            # Se algum campo enriquecível está cheio, parou de chegar dados
            if data.get("meaning") or data.get("decomposition"):
                return data
        
        delay = min(delay * 1.5, 60)  # backoff: 10 → 15 → 22 → 34 → 51s, max 60
    
    return response.json()  # retorna com campos parciais ou vazios
```

### 3. Buscar e manipular traduções

```python
# Criar palavra (sem associação automática de traduções)
POST http://localhost:7998/word-api/word
{"word": "愛人", "frequency": 150, "confidence_level": 2, "tone_pair": 51}

→ 201
{"word": "愛人", "frequency": 150, "calls": 0, "confidence_level": 2, "tone_pair": 51, "try": null, "try_translation": null}

# Adicionar tradução
PUT http://localhost:7998/word-api/word/愛人/translations
{"translation": "lover"}

→ 201
{"word": "愛人", "translation": "lover", "created_at": "2026-06-22T10:35:00"}

# Obter palavra + todas as traduções
GET http://localhost:7998/word-api/word/愛人

→ 200
{
  "word": "愛人",
  "frequency": 150,
  "calls": 1,
  "confidence_level": 2,
  "tone_pair": 51,
  "try": null,
  "try_translation": null,
  "translations": [
    {"word": "愛人", "translation": "lover", "created_at": "2026-06-22T10:35:00"},
    {"word": "愛人", "translation": "sweetheart", "created_at": "2026-06-22T10:36:00"}
  ]
}

# Buscar por query (suporta CJK + tradução)
GET http://localhost:7998/word-api/word/search?q=愛

→ 200
[
  {"word": "愛人", "frequency": 150, "calls": 42, ...},
  {"word": "愛好", "frequency": 300, "calls": 15, ...}
]
```

---

## 🔍 Detalhes de comportamento

### GET /hanzi-api/hanzi/{character}
- Increments `calls` counter **asynchronously** (não bloqueia response)
- Pode retornar 200 com campos vazios se o enrich ainda não começou/falhou
- Retorna exatamente um objeto (nunca array)

### POST /hanzi-api/hanzi
- Retorna **imediatamente** com campos vazios (`calls=0`, `meaning=""`, etc.)
- Background task é enfileirado no mesmo processo (não há fila persistente)
- Se o container reiniciar durante o enrich, a task é perdida

### PUT /hanzi-api/hanzi/{character}/enrich
- Util para re-enriquecer dados ou quando enrich inicial falhou
- Retorna 202 (Accepted), não 201
- Sobrescreve campos enriquecidos anteriormente

### GET /word-api/word/{word}
- Retorna palavra + array `translations` (pode estar vazio)
- Incrementa `calls` asynchronously

### PUT /word-api/word/{word}/translations
- Cria nova tradução (duplicatas não são impedidas, use UPSERT se necessário)
- A palavra deve existir (409/404 caso contrário)

### GET /word-api/word/search?q=...
- Busca por:
  - Caracteres chineses exatos
  - Prefixo em pinyin (se implementado)
  - Tradução fuzzy
- Ordenado por `calls` DESC (mais acessadas primeiro)
- Retorna array (nunca null, pode estar vazio)

---

## 🛡️ Tratamento de erro

### Status codes esperados
| Code | Endpoint | Significado |
|------|----------|-------------|
| 200 | GET /hanzi/{char}, GET /word/{word}, GET /word/search | OK, dado retornado |
| 201 | POST /hanzi, POST /word, PUT /word/{word}/translations | Criado com sucesso |
| 202 | PUT /hanzi/{char}/enrich | Enrich enfileirado, ainda processando |
| 404 | GET /hanzi/{char}, GET /word/{word}, PUT /word/{word}/translations | Não encontrado |

### Erro não esperado (500)
- LLM timeout: enrich falha silenciosamente, background task registra erro em log
- DB indisponível: aplicação retorna 500, conexão é retentada
- Scraper falha: `appears_in` fica vazio, não bloqueia enrich

### Campos vazios vs NULL
- Campo enriquecível (`meaning`, `appears_in`, etc.) ausente ou falho no LLM/scraper = `""`
- Campo metadado (`try`, `try_translation`) reservado = `null`
- Nunca será `null` um campo de string esperado; sempre é `""` ou um valor

---

## ⏱️ Timeouts e timing

| Operação | Latência típica | Timeout |
|----------|---|---|
| POST hanzi | <100ms | 1s |
| GET hanzi (enrich ainda em andamento) | <50ms | 1s |
| DeepSeek LLM call | 15-45s | 60s (configurado) |
| HanziCraft scrape | 5-30s | 30s (configurado) |
| Background enrich completo | 30-90s | Sem timeout (async) |

**Recomendação:** Se fazer polling, use initial delay de 10-15s, depois backoff.

---

## 📝 Exemplo completo: Criar hanzi, aguardar enriquecimento, listar dados

```python
import requests
import time

BASE_URL = "http://localhost:7998"

# 1. Criar hanzi
print("[1] Criando hanzi...")
resp = requests.post(f"{BASE_URL}/hanzi-api/hanzi", json={
    "character": "故",
    "frequency": 1200
})
print(f"    Status: {resp.status_code}")
print(f"    Resposta: {resp.json()}")

# 2. Aguardar enriquecimento
print("[2] Aguardando enriquecimento (30s)...")
time.sleep(30)

# 3. Obter dados
print("[3] Obtendo dados enriquecidos...")
resp = requests.get(f"{BASE_URL}/hanzi-api/hanzi/故")
data = resp.json()
print(f"    Significado: {data['meaning'][:50] if data['meaning'] else '(vazio)'}")
print(f"    Decomposição: {data['decomposition'][:50] if data['decomposition'] else '(vazio)'}")
print(f"    Aparece em: {data['appears_in'][:50] if data['appears_in'] else '(vazio)'}")
print(f"    Palavras relacionadas: {data['related_words'][:50] if data['related_words'] else '(vazio)'}")
print(f"    Chamadas: {data['calls']}")
```

---

## 🔧 Configuração de proxy corporativo

Se a API rodar atrás de um proxy SSL-intercepting (corporate proxy):

1. Defina a variável de ambiente **antes** de iniciar o container:
   ```bash
   SSL_VERIFY=false docker-compose up hanzi_app
   ```

2. Ou adicione ao `.env`:
   ```
   SSL_VERIFY=false
   ```

3. Ou no `docker-compose.yml`:
   ```yaml
   environment:
     SSL_VERIFY: "false"
   ```

Sem isso, DeepSeek e HanziCraft retornarão `SSL: CERTIFICATE_VERIFY_FAILED`.

---

## 📋 Referência rápida de endpoints

```
POST   /hanzi-api/hanzi                     → Criar hanzi (dispara enrich async)
GET    /hanzi-api/hanzi/{character}         → Obter hanzi
PUT    /hanzi-api/hanzi/{character}/enrich  → Re-enriquecer

GET    /word-api/word/health                → Health check
POST   /word-api/word                       → Criar palavra
GET    /word-api/word/search?q=...          → Buscar palavras
GET    /word-api/word/{word}                → Obter palavra + traduções
PUT    /word-api/word/{word}/translations   → Adicionar tradução
GET    /word-api/word/{word}/translations   → Listar traduções da palavra
```

---

## 🎯 Para outro modelo de IA usar esta API

1. Leia este arquivo inteiro (especialmente "Conceitos-chave" e "Common Patterns")
2. Consulte [openapi.json](./openapi.json) para estrutura exata de schemas
3. Implementar polling com backoff para operações async (POST hanzi, PUT enrich)
4. Sempre validar se campo enriquecido é `""` antes de confiar no dados
5. Respeitar timeouts (não esperar mais que ~120s por enrich, considerar falha)
