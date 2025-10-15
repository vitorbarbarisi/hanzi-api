"""Example usage of LLM integrations for Chinese character analysis.

This module demonstrates how to use the OpenAI and DeepSeek integrations
for analyzing Chinese characters.
"""

from .openai_integration import OpenAiIntegration
from .deepseek_integration import DeepSeekIntegration


def example_openai_usage():
    """Example of using OpenAI integration for character analysis."""
    # Analyze a single character
    character = "愛"
    openai = OpenAiIntegration(character)
    
    # Get character meaning
    meaning = openai.get_meaning()
    print(f"Meaning of {character}: {meaning}")
    
    # Get decomposition
    decomposition = openai.get_decomposition()
    print(f"Decomposition of {character}: {decomposition}")
    
    # Get related words
    related_words = openai.get_related_words()
    print(f"Related words with {character}: {related_words}")
    
    # For sentence analysis
    sentence = "我愛你"
    sentence_ai = OpenAiIntegration(sentence)
    
    # Get sentence breakdown
    breakdown = sentence_ai.get_sentence_breakdown()
    print(f"Sentence breakdown: {breakdown}")
    
    # Get full translation with explanations
    translation = sentence_ai.get_sentence_translation()
    print(f"Translation with explanations: {translation}")
    
    # Evaluate translation score
    user_translation = "Eu te amo"
    ai_translation = "Eu amo você"
    score = sentence_ai.get_translation_score(user_translation, ai_translation)
    print(f"Translation score: {score}")


def example_deepseek_usage():
    """Example of using DeepSeek integration for character decomposition."""
    character = "愛"
    deepseek = DeepSeekIntegration(character)
    
    # Get detailed decomposition analysis
    decomposition_analysis = deepseek.get_decomposition()
    print(f"DeepSeek decomposition analysis: {decomposition_analysis}")


def example_combined_usage():
    """Example of using both integrations together."""
    character = "學"
    
    # Use OpenAI for meaning and related words
    openai = OpenAiIntegration(character)
    meaning = openai.get_meaning()
    related_words = openai.get_related_words()
    
    # Use DeepSeek for detailed decomposition
    deepseek = DeepSeekIntegration(character)
    decomposition = deepseek.get_decomposition()
    
    print(f"Character: {character}")
    print(f"Meaning (OpenAI): {meaning}")
    print(f"Related words (OpenAI): {related_words}")
    print(f"Decomposition (DeepSeek): {decomposition}")


if __name__ == "__main__":
    # Note: Make sure to set environment variables:
    # - OPENAI_API_KEY for OpenAI integration
    # - DEEPSEEK_API_KEY for DeepSeek integration
    
    print("=== OpenAI Integration Example ===")
    example_openai_usage()
    
    print("\n=== DeepSeek Integration Example ===")
    example_deepseek_usage()
    
    print("\n=== Combined Usage Example ===")
    example_combined_usage()
