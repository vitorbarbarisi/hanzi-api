"""DeepSeek integration for Hanzi analysis and translation."""

import json
import os
from typing import Optional

from langchain_core.messages import HumanMessage, SystemMessage
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI
from pydantic import BaseModel, Field

from .config import config


class DecompositionResponse(BaseModel):
    """Structured response model for character decomposition."""
    decomposition: str = Field(description="A decomposição visual do caracter em seus componentes/radicais")
    decomposition_meaning: str = Field(description="O significado e explicação dos componentes que formam o caracter em uma linha")


class DeepSeekIntegration:
    """DeepSeek integration for Chinese character analysis and translation."""

    def __init__(self, character: str):
        """Initialize the DeepSeek integration.

        Args:
            character: The Chinese character to analyze
        """
        self.character = character
        self.api_key = config.deepseek_api_key
        self.llm = None

        if self.api_key:
            self.llm = ChatOpenAI(
                model="deepseek-chat",
                base_url="https://api.deepseek.com/v1",
                api_key=self.api_key,
                temperature=0,
                request_timeout=60,
                max_retries=2
            )
    
    def get_meaning(self) -> str:
        """Get the meaning of the Chinese character.

        Returns:
            The meaning and usage context of the character
        """
        if self.llm is None:
            return f"DeepSeek API não configurada. Para configurar: defina a variável de ambiente DEEPSEEK_API_KEY"

        messages = [
            SystemMessage(content="Você é um professor de chinês. Diga quando o caracter possui mais de um significado e em qual contexto ele é utilizado. Por favor use caracteres chineses tradicionais. Inclua o pinyin do caracter. Vá direto ao ponto, não precisa me dar lembretes. Eu já sei que o significado depende do contexto. Não precisa me dizer que é necessário considerar o contexto para determinar o significado preciso."),
            HumanMessage(content=f"Responda com o significado do seguinte caracter: {self.character}")
        ]
        response = self.llm.invoke(messages)
        return response.content

    def get_related_words(self) -> str:
        """Get words that contain the Chinese character.

        Returns:
            List of related words containing the character
        """
        if self.llm is None:
            return f"DeepSeek API não configurada. Para configurar: defina a variável de ambiente DEEPSEEK_API_KEY"

        messages = [
            SystemMessage(content="Você é um professor de chinês. Responde APENAS com uma lista de palavras que contêm o caracter solicitado. Use o formato: 'palavra - significado' (uma por linha, SEM numeração). NÃO inclua explicações, cumprimentos ou texto introdutório. Use caracteres chineses tradicionais."),
            HumanMessage(content=f"Liste palavras com o caracter: {self.character}")
        ]
        response = self.llm.invoke(messages)
        return response.content

    def get_decomposition(self) -> str:
        """Get detailed decomposition analysis of the Chinese character.
        
        Returns:
            JSON string with decomposition and meaning explanation
        """
        # Fallback if no API key is configured
        if self.api_key is None:
            return json.dumps({
                "decomposition": f"Caracter: {self.character}",
                "decomposition_meaning": "DeepSeek API não configurada. Para configurar: defina a variável de ambiente DEEPSEEK_API_KEY"
            }, ensure_ascii=False)
        
        try:
            # Create prompt template
            prompt = ChatPromptTemplate.from_messages([
                ("system", """Você é um especialista em análise de caracteres chineses. Analise o caracter fornecido e forneça:

1. A decomposição: Como o caracter é formado visualmente (ex para 後: "彳 (andar/movimento) + 幺(pequeno/fino) + 夂 (passo lento/pé descendo).")
2. O significado da decomposição: frase explicativa de como os componentes de relacionam para formar o significado do caracter. Não diga a descrição da decomposição, apenas o que ela sugere/signigica. (ex para 現: algo que se torna visível ou se manifesta, como um tesouro ou verdade que aparece.)

Use caracteres chineses tradicionais. Seja claro e conciso."""),
                ("human", "Analise o caracter: {character}")
            ])
            
            # Create chain with structured output
            chain = prompt | self.llm.with_structured_output(DecompositionResponse)
            
            # Invoke and get structured response
            response = chain.invoke({"character": self.character})
            
            # Convert to JSON format
            return json.dumps({
                "decomposition": response.decomposition,
                "decomposition_meaning": response.decomposition_meaning
            }, ensure_ascii=False)
            
        except Exception as e:
            return json.dumps({
                "decomposition": f"Caracter: {self.character}",
                "decomposition_meaning": f"Erro ao obter decomposição: {str(e)}. Verifique sua configuração da API DeepSeek"
            }, ensure_ascii=False)
