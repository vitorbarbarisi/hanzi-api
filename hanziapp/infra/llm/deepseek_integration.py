"""DeepSeek integration for Hanzi decomposition analysis."""

import json
import os
from typing import Optional

from dotenv import load_dotenv
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI
from pydantic import BaseModel, Field


class DecompositionResponse(BaseModel):
    """Structured response model for character decomposition."""
    decomposition: str = Field(description="A decomposição visual do caracter em seus componentes/radicais")
    decomposition_meaning: str = Field(description="O significado e explicação dos componentes que formam o caracter em uma linha")


class DeepSeekIntegration:
    """DeepSeek integration for Chinese character decomposition analysis."""
    
    def __init__(self, character: str):
        """Initialize the DeepSeek integration.
        
        Args:
            character: The Chinese character to analyze
        """
        self.character = character
        self.api_key = self.setup()
        self.llm = None
        
        if self.api_key:
            self.llm = ChatOpenAI(
                model="deepseek-chat",
                base_url="https://api.deepseek.com/v1",
                api_key=self.api_key,
                temperature=0
            )
    
    def setup(self) -> Optional[str]:
        """Setup environment variables for DeepSeek.
        
        Returns:
            The DeepSeek API key if available, None otherwise
        """
        load_dotenv()
        # Return the DeepSeek API key
        api_key = os.environ.get("DEEPSEEK_API_KEY")
        if api_key:
            return api_key.strip()
        else:
            return None  # Allow functioning without API key
    
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
