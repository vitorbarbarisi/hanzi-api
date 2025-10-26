"""OpenAI integration for Hanzi analysis and translation."""

import json
import logging
import os
from typing import Any, Dict

from langchain_core.messages import HumanMessage, SystemMessage
from langchain_core.prompts import ChatPromptTemplate
from langchain_openai import ChatOpenAI
from pydantic import BaseModel, Field

from .config import config


class OpenAiIntegration:
    """OpenAI integration for Chinese character analysis and translation."""
    
    def __init__(self, character: str):
        """Initialize the OpenAI integration.
        
        Args:
            character: The Chinese character or text to analyze
        """
        self.character = character
        # Use centralized configuration - no need to load .env multiple times
        self.api_key = config.openai_api_key
        
        if not self.api_key:
            raise ValueError("OpenAI API key not found. Please set OPENAI_API_KEY environment variable.")
            
        self.llm = ChatOpenAI(
            model="gpt-4o-mini",
            temperature=0,
            request_timeout=60,  # 60 second timeout to prevent hanging connections
            max_retries=2
        )
    
    def get_meaning(self) -> str:
        """Get the meaning of the Chinese character.
        
        Returns:
            The meaning and usage context of the character
        """
        messages = [
            SystemMessage(content="Você é um professor de chinês. Diga quando o caracter possui mais de um significado e em qual contexto ele é utilizado. Por favor use caracteres chineses tradicionais. Inclua o pinyin do caracter. Vá direto ao ponto, não precisa me dar lembretes. Eu já sei que o significado depende do contexto. Não precisa me dizer que é necessário considerar o contexto para determinar o significado preciso."),
            HumanMessage(content=f"Responda com o significado do seguinte caracter: {self.character}")
        ]
        response = self.llm.invoke(messages)
        return response.content
    
    def get_decomposition(self) -> str:
        """Get the decomposition of the Chinese character.
        
        Returns:
            The decomposition analysis of the character
        """
        messages = [
            SystemMessage(content="Você é um professor de chinês. Responde em português. Se precisar fazer referência a um caracter, use o caracter tradicional. Caso um caracter tenha diferentes composições, me mostre todas as opções."),
            HumanMessage(content=f"Responda com a decomposição de: {self.character}")
        ]
        response = self.llm.invoke(messages)
        return response.content
    
    def get_related_words(self) -> str:
        """Get words that contain the Chinese character.
        
        Returns:
            List of related words containing the character
        """
        messages = [
            SystemMessage(content="Você é um professor de chinês. Responde APENAS com uma lista de palavras que contêm o caracter solicitado. Use o formato: 'palavra - significado' (uma por linha, SEM numeração). NÃO inclua explicações, cumprimentos ou texto introdutório. Use caracteres chineses tradicionais."),
            HumanMessage(content=f"Liste palavras com o caracter: {self.character}")
        ]
        response = self.llm.invoke(messages)
        return response.content
    