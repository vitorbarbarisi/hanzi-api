# Background Tasks para Enriquecimento LLM

Este documento explica como funciona o sistema de background tasks que enriquece automaticamente os dados de hanzi usando integrações LLM (OpenAI e DeepSeek).

## Como Funciona

### 1. Fluxo de Criação de Hanzi

Quando um novo hanzi é criado via `POST /hanzi`:

1. **Criação Imediata**: O hanzi é salvo no banco com dados básicos (`character`, `frequency`)
2. **Resposta Rápida**: API retorna `201 Created` imediatamente
3. **Background Task**: Uma tarefa em background é iniciada para enriquecer os dados
4. **Enriquecimento LLM**: As integrações LLM coletam informações adicionais
5. **Atualização**: O registro é atualizado com os dados enriquecidos

### 2. Dados Coletados pelas LLMs

#### OpenAI Integration (GPT-4o-mini)
- **`meaning`**: Significado detalhado do caracter com pinyin
- **`related_words`**: Lista de palavras que contêm o caracter

#### DeepSeek Integration  
- **`appears_in`**: Análise de decomposição e significado dos componentes

## Configuração

### 1. Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
# OpenAI Configuration (obrigatório)
OPENAI_API_KEY=sua_chave_openai_aqui

# DeepSeek Configuration (opcional)
DEEPSEEK_API_KEY=sua_chave_deepseek_aqui
```

### 2. Dependências

As dependências necessárias já estão no `pyproject.toml`:

```toml
langchain = "^0.1.0"
langchain-openai = "^0.1.0"
langchain-core = "^0.1.0"
```

Instale com:
```bash
poetry install
```

## Uso da API

### Criar um Hanzi

```bash
curl -X POST "http://localhost:8000/hanzi" \
  -H "Content-Type: application/json" \
  -d '{
    "character": "愛",
    "frequency": 100
  }'
```

**Resposta Imediata (201 Created):**
```json
{
  "character": "愛",
  "frequency": 100,
  "calls": 0,
  "meaning": "",
  "decomposition": "",
  "appears_in": "",
  "related_words": ""
}
```

### Verificar Dados Enriquecidos

Após alguns segundos/minutos (dependendo da API), consulte o hanzi:

```bash
curl "http://localhost:8000/hanzi/愛"
```

**Resposta Enriquecida (200 OK):**
```json
{
  "character": "愛",
  "frequency": 100,
  "calls": 1,
  "meaning": "愛 (ài) significa \"amor\" em chinês. É um caracter fundamental que expressa sentimentos profundos de afeição...",
  "decomposition": "",
  "appears_in": "Uma mão (garra) que segura cuidadosamente o coração, simbolizando o cuidado e proteção do amor",
  "related_words": "愛人 - amante, cônjuge\\n愛好 - hobby, interesse\\n愛情 - amor romântico..."
}
```

## Monitoramento

### Logs da Background Task

Os logs da background task aparecem no console da aplicação:

```
Starting LLM enrichment for character: 愛  
Enrichment data gathered for 愛
Meaning: 愛 (ài) significa "amor" em chinês...
Related words: 愛人 - amante, cônjuge...
Appears in: Uma mão (garra) que segura cuidadosamente...
✅ Successfully enriched hanzi: 愛
```

### Tratamento de Erros

- **OpenAI API Error**: Erro é logado, campo `meaning` e `related_words` ficam vazios
- **DeepSeek API Error**: Fallback para mensagem explicativa em `appears_in`
- **Database Error**: Erro é logado, hanzi básico permanece no banco

## Arquitetura

### Componentes Envolvidos

1. **Router** (`hanziapp.api.routers.hanzi.hanzi`): 
   - Recebe requisição POST
   - Chama serviço de criação
   - Inicia background task

2. **Service** (`hanziapp.core.hanzi.services.hanzi_service`):
   - `create()`: Persiste hanzi básico
   - `enrich_hanzi_background()`: Enriquece com LLM

3. **LLM Integrations** (`hanziapp.infra.llm`):
   - `OpenAiIntegration`: Meaning e related words
   - `DeepSeekIntegration`: Decomposition analysis

### Tecnologia Utilizada

- **FastAPI BackgroundTasks**: Para execução em background
- **LangChain**: Para integrações LLM
- **Async/Await**: Para operações não-bloqueantes

## Vantagens da Implementação

1. **Resposta Rápida**: API não bloqueia aguardando LLMs
2. **Resiliência**: Falhas na LLM não impedem criação do hanzi
3. **Escalabilidade**: Background tasks podem ser processadas em paralelo
4. **Flexibilidade**: Fácil adicionar novas fontes de dados

## Limitações

1. **Dados Assíncronos**: Dados enriquecidos não estão disponíveis imediatamente
2. **Dependência de APIs**: Requer chaves de API válidas
3. **Tempo de Processamento**: Varia conforme resposta das LLMs
4. **Custo**: Cada hanzi criado gera chamadas para APIs pagas

## Exemplos e Testes

Veja o arquivo `hanziapp/infra/llm/background_task_example.py` para:
- Simulação do fluxo completo
- Exemplos de dados retornados
- Como testar a funcionalidade
