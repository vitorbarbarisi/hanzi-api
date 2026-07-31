"""Example usage of the DeepSeek integration for Chinese character analysis.

Requires the DEEPSEEK_API_KEY environment variable to be set.
"""

from .deepseek_integration import DeepSeekIntegration


def example_deepseek_usage():
    """Example of using DeepSeek integration for character analysis."""
    character = "愛"
    deepseek = DeepSeekIntegration(character)

    # Get character meaning
    meaning = deepseek.get_meaning()
    print(f"Meaning of {character}: {meaning}")

    # Get related words
    related_words = deepseek.get_related_words()
    print(f"Related words with {character}: {related_words}")

    # Get detailed decomposition analysis (returns JSON string)
    decomposition_analysis = deepseek.get_decomposition()
    print(f"Decomposition analysis: {decomposition_analysis}")


if __name__ == "__main__":
    example_deepseek_usage()
