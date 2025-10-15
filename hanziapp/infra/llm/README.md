# LLM Integrations Module

Este módulo fornece integrações com serviços de AI/LLM para análise de caracteres chineses e tradução.

## Integrações Disponíveis

### OpenAI Integration
- **Modelo**: GPT-4o-mini
- **Funcionalidades**:
  - Análise de significado de caracteres
  - Decomposição de caracteres
  - Palavras relacionadas
  - Quebra de frases em palavras
  - Tradução detalhada com explicações gramaticais
  - Avaliação de traduções
  - Tradução completa de histórias

### DeepSeek Integration
- **Modelo**: deepseek-chat
- **Funcionalidades**:
  - Análise detalhada de decomposição de caracteres
  - Significado dos componentes

## Configuração

### Variáveis de Ambiente

Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```env
# OpenAI Configuration
OPENAI_API_KEY=sua_chave_openai_aqui

# DeepSeek Configuration (opcional)
DEEPSEEK_API_KEY=sua_chave_deepseek_aqui
```

### Instalação de Dependências

Execute o comando para instalar as dependências necessárias:

```bash
poetry install
```

## Uso Básico

```python
from hanziapp.infra.llm import OpenAiIntegration, DeepSeekIntegration

# Análise com OpenAI
character = "愛"
openai = OpenAiIntegration(character)

meaning = openai.get_meaning()
decomposition = openai.get_decomposition()
related_words = openai.get_related_words()

# Análise com DeepSeek
deepseek = DeepSeekIntegration(character)
detailed_decomposition = deepseek.get_decomposition()
```

## Funcionalidades Detalhadas

### OpenAI Integration

#### Análise de Caracteres
```python
openai = OpenAiIntegration("學")

# Significado do caracter
meaning = openai.get_meaning()

# Decomposição do caracter
decomposition = openai.get_decomposition()

# Palavras que contêm o caracter
related_words = openai.get_related_words()
```

#### Análise de Frases
```python
sentence = "我愛你"
openai = OpenAiIntegration(sentence)

# Quebrar frase em palavras
breakdown = openai.get_sentence_breakdown()

# Tradução com explicações detalhadas
translation = openai.get_sentence_translation()  # Retorna JSON

# Avaliar tradução do usuário
score = openai.get_translation_score(
    user_translation="Eu te amo",
    ai_translation="Eu amo você"
)  # Retorna pontuação 0-100
```

#### Tradução de Histórias
```python
story = "很久很久以前，有一個美麗的公主。"
openai = OpenAiIntegration(story)

full_translation = openai.get_full_story_translation(story)
```

### DeepSeek Integration

```python
deepseek = DeepSeekIntegration("現")

# Análise detalhada de decomposição
result = deepseek.get_decomposition()  # Retorna JSON
```

O resultado inclui:
- `decomposition`: Como o caracter é formado visualmente
- `decomposition_meaning`: Significado dos componentes

## Estrutura do Módulo

```
hanziapp/infra/llm/
├── __init__.py                 # Exportações do módulo
├── openai_integration.py       # Integração OpenAI
├── deepseek_integration.py     # Integração DeepSeek
├── example_usage.py           # Exemplos de uso
└── README.md                  # Esta documentação
```

## Tratamento de Erros

- **OpenAI**: Se a API key não estiver configurada, as operações falharão com exceções apropriadas
- **DeepSeek**: Se a API key não estiver configurada, retorna mensagens explicativas em JSON

## Considerações de Performance

- As chamadas para APIs externas podem ser lentas
- Considere implementar cache para respostas frequentes
- Use as integrações em tarefas assíncronas quando possível

## Exemplos Completos

Veja o arquivo `example_usage.py` para exemplos detalhados de cada funcionalidade.
