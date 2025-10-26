"""Centralized configuration for LLM integrations."""

import os
from typing import Optional
from dotenv import load_dotenv


class LLMConfig:
    """Singleton configuration class for LLM integrations."""
    
    _instance: Optional['LLMConfig'] = None
    _initialized: bool = False
    
    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
    
    def __init__(self):
        """Initialize configuration if not already initialized."""
        if not self._initialized:
            self._load_environment()
            self._initialized = True
    
    def _load_environment(self) -> None:
        """Load environment variables once."""
        # Load .env file once
        load_dotenv()
        
        # Cache API keys
        self._openai_api_key = os.environ.get("OPENAI_API_KEY")
        self._deepseek_api_key = os.environ.get("DEEPSEEK_API_KEY")
        
        # Clean up API keys (remove extra spaces)
        if self._openai_api_key:
            self._openai_api_key = self._openai_api_key.strip()
            # Set cleaned key back to environment for langchain
            os.environ["OPENAI_API_KEY"] = self._openai_api_key
            
        if self._deepseek_api_key:
            self._deepseek_api_key = self._deepseek_api_key.strip()
    
    @property
    def openai_api_key(self) -> Optional[str]:
        """Get OpenAI API key."""
        return self._openai_api_key
    
    @property  
    def deepseek_api_key(self) -> Optional[str]:
        """Get DeepSeek API key."""
        return self._deepseek_api_key


# Global instance
config = LLMConfig()
