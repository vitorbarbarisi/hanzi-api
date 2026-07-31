# HanziAPI — Documentação para IA Codificadora

**Versão:** 0.0.1
**Ambiente:** `http://localhost:7998`
**Esquema Completo:** [openapi.json](./openapi.json) (gerado pelo FastAPI — fonte da verdade; também disponível em `GET /openapi.json` na app rodando)

## 📋 Referência rápida de endpoints

```
POST   /hanzi-api/hanzi                     → Criar hanzi (dispara enrich async)
GET    /hanzi-api/hanzi/{character}         → Obter hanzi
PUT    /hanzi-api/hanzi/{character}/enrich  → Re-enriquecer (202)

GET    /word-api/health                     → Health check
POST   /word-api/                           → Criar palavra
GET    /word-api/search?q=...               → Buscar palavras
GET    /word-api/{word}                     → Obter palavra + traduções
PUT    /word-api/{word}/translations        → Adicionar tradução
GET    /word-api/{word}/translations        → Listar traduções da palavra
```

⚠️ **Atenção aos prefixos:** os endpoints de word ficam direto sob `/word-api/`
(NÃO existe `/word-api/word/...`). Os de hanzi ficam sob `/hanzi-api/hanzi/...`.

## ⚠️ Conceitos-chave para IA

### Assincronia
- **POST /hanzi-api/hanzi** e **PUT /hanzi-api/hanzi/{character}/enrich** disparam background tasks
- Respostas retornam **imediatamente** (201, 202) enquanto o processamento continua
- Para obter dados enriquecidos, **faça polling via GET** após alguns segundos
- Latência típica do enrich: 30–90s (DeepSeek + HanziCraft)
- A fila é in-process (FastAPI BackgroundTasks): se o container reiniciar durante o enrich, a task é perdida — use o PUT `/enrich` para redisparar

### Campos de enriquecimento (entidade Hanzi)
| Campo | Preenchido por | Exemplo |
|-------|--------|---------|
| `meaning` | DeepSeek LLM | `愛 (ài) significa 'amor'...` |
| `related_words` | DeepSeek LLM | `愛人 - amante\n愛好 - hobby` |
| `decomposition` | DeepSeek LLM | `爫 + 冖 + 心 + 夊` |
| `decomposition_meaning` | DeepSeek LLM | `Uma mão que segura o coração` |
| `appears_in` | HanziCraft scraper | `戀 曖` (vazio se a seção não existe na página) |

### Tratamento de erro transparente
- LLM ou scraper falham? O enrich continua; campos que falharam ficam `""`
- Um valor de `appears_in` já existente **não** é sobrescrito por scrape vazio
- Sempre verifique se um campo é `""` antes de usar

---

## 📦 Schemas reais

### Hanzi
```json
{
  "character": "愛",
  "frequency": 394,
  "calls": 20,
  "meaning": "愛 (ài) significa 'amor'...",
  "decomposition": "爫 + 冖 + 心 + 夊",
  "decomposition_meaning": "Uma mão que cobre e protege o coração...",
  "appears_in": "",
  "related_words": "愛情 - amor\n愛好 - hobby"
}
```
`CreateHanziDto` (POST): `{"character": "愛", "frequency": 394}` — os demais campos são preenchidos pelo enrich.

### Word
```json
{
  "word": "愛人",
  "pinyin": "ài rén",
  "translation": "lover",
  "calls": 42,
  "confidence_level": 2,
  "tone_pair": 42
}
```
`CreateWordDto` (POST `/word-api/`):
```json
{"word": "愛人", "pinyin": "ài rén", "translation": "lover", "confidence_level": 2}
```
- `confidence_level`: obrigatório, inteiro 1–3 (validado com 422)
- `tone_pair`: **derivado automaticamente do pinyin** (um dígito de tom por sílaba, tom neutro = 5; ex.: `"ài rén"` → `42`). Não envie manualmente.
- `calls`: inicia em 0

### WordWithTranslations (GET /word-api/{word})
Campos de `Word` + `translations` como **lista de strings**:
```json
{
  "word": "愛人",
  "pinyin": "ài rén",
  "translation": "lover",
  "calls": 42,
  "confidence_level": 2,
  "tone_pair": 42,
  "translations": ["lover", "sweetheart"]
}
```

### WordTranslation (PUT/GET /word-api/{word}/translations)
```json
{"id": 7, "word": "愛人", "translation": "sweetheart"}
```
Request do PUT: `{"translation": "sweetheart"}`. Duplicatas **não** são impedidas.

---

## 📚 Common Patterns para IA

### 1. Criar hanzi e esperar enriquecimento

```python
# Passo 1: POST (201 - retorna imediatamente com campos vazios)
POST /hanzi-api/hanzi
{"character": "愛", "frequency": 394}

# Passo 2: polling com backoff até meaning/decomposition preencherem
import time, requests

def wait_for_enrichment(character, max_attempts=5, initial_delay=15):
    delay = initial_delay
    for _ in range(max_attempts):
        time.sleep(delay)
        r = requests.get(f"http://localhost:7998/hanzi-api/hanzi/{character}")
        if r.status_code == 200:
            data = r.json()
            if data.get("meaning") or data.get("decomposition"):
                return data
        delay = min(delay * 1.5, 60)
    return r.json()  # parcial ou vazio após timeout
```

### 2. Criar palavra e gerenciar traduções

```python
# Criar (note o path: /word-api/ — sem segmento extra)
POST /word-api/
{"word": "愛人", "pinyin": "ài rén", "translation": "lover", "confidence_level": 2}
→ 201 {"word": "愛人", "pinyin": "ài rén", "translation": "lover", "calls": 0, "confidence_level": 2, "tone_pair": 42}

# Adicionar tradução alternativa
PUT /word-api/愛人/translations
{"translation": "sweetheart"}
→ 201 {"id": 7, "word": "愛人", "translation": "sweetheart"}

# Obter palavra + traduções
GET /word-api/愛人
→ 200 {..., "translations": ["sweetheart"]}
```

### 3. Buscar palavras

```python
GET /word-api/search?q=愛     # contém CJK → busca em word LIKE %q%
GET /word-api/search?q=love   # sem CJK → busca em translation (case-insensitive),
                              # incluindo as traduções alternativas
→ 200 [ {Word}, ... ]  # ordenado por calls DESC (mais acessadas primeiro); pode ser []
```

---

## 🔍 Detalhes de comportamento

- **GET /hanzi-api/hanzi/{character}** e **GET /word-api/{word}** incrementam o contador `calls` de forma assíncrona e atômica (não bloqueia a resposta)
- **GET /hanzi-api/hanzi/{character}** usa cache em memória (por processo); o cache é invalidado em updates
- **PUT /hanzi-api/hanzi/{character}/enrich** retorna `202` com `{"message": "Enrichment task started", "character": "...", "status": "processing"}`, ou `404` se o hanzi não existe
- **404s** retornam `{"description": "Hanzi not found"}` / `{"description": "Word not found"}` (o PUT enrich usa `{"error": ..., "character": ...}`)
- **422** para payloads inválidos (formato padrão do FastAPI, schema `HTTPValidationError`)

## ⏱️ Timeouts e timing

| Operação | Latência típica |
|----------|---|
| POST/GET (CRUD) | <100ms |
| DeepSeek LLM (por chamada) | 15–45s (timeout 60s, 2 retries) |
| HanziCraft scrape | 5–30s (timeout 30s) |
| Enrich completo (background) | 30–90s |

**Recomendação de polling:** delay inicial de 10–15s, backoff até 60s, desistir após ~120s.

## 🔧 Configuração de proxy corporativo

Atrás de proxy com interceptação SSL, defina `SSL_VERIFY=false` (no `.env` ou no
`docker-compose.yml`) antes de subir o container — sem isso, DeepSeek e HanziCraft
falham com `SSL: CERTIFICATE_VERIFY_FAILED`. O default é `true` (verificação ativa).
