"""Example of how the background task enrichment works.

This example demonstrates the flow that happens when a new hanzi is created:

1. User POST /hanzi with character data
2. Hanzi is created in database with basic info
3. Background task is triggered to enrich with LLM data
4. LLM integrations gather meaning, related_words, and appears_in
5. Database is updated with enriched data

Example API call and expected behavior:
"""

import json

# Example POST request to create a hanzi
example_post_request = {
    "character": "愛",
    "frequency": 100
}

# What happens in the background task:
def example_background_enrichment():
    """
    This simulates what happens in the background task after hanzi creation.
    """
    character = "愛"
    
    print(f"=== Background Task Started for {character} ===")
    
    # 1. OpenAI Integration gets meaning
    example_meaning = """
    愛 (ài) significa "amor" em chinês. É um caracter fundamental que expressa 
    sentimentos profundos de afeição, carinho e amor romântico. Usado em 
    contextos familiares e românticos.
    
    Pinyin: ài
    """
    
    # 2. OpenAI Integration gets related words
    example_related_words = """
    愛人 - amante, cônjuge
    愛好 - hobby, interesse
    愛情 - amor romântico
    可愛 - fofo, adorável
    親愛 - querido, amado
    愛護 - cuidar, proteger
    """
    
    # 3. DeepSeek Integration gets decomposition meaning
    example_deepseek_response = {
        "decomposition": "爪 (garra) + 心 (coração) + 夂 (passo lento)",
        "decomposition_meaning": "Uma mão (garra) que segura cuidadosamente o coração, simbolizando o cuidado e proteção do amor"
    }
    
    print("OpenAI Meaning:")
    print(example_meaning[:100] + "...")
    
    print("\nOpenAI Related Words:")  
    print(example_related_words[:100] + "...")
    
    print("\nDeepSeek Appears In:")
    print(example_deepseek_response["decomposition_meaning"])
    
    # 4. Database update would happen here
    print(f"\n✅ Database updated for character: {character}")
    print("=== Background Task Completed ===")


# Example of complete API flow
def example_complete_flow():
    """
    Shows the complete flow from API request to enriched data.
    """
    print("=== Complete Hanzi Creation Flow ===")
    
    # Step 1: User creates hanzi
    print("1. User POST /hanzi")
    print(f"   Request: {json.dumps(example_post_request, ensure_ascii=False)}")
    
    # Step 2: Immediate response (before enrichment)
    immediate_response = {
        "character": "愛",
        "frequency": 100,
        "calls": 0,
        "meaning": "",
        "decomposition": "",
        "appears_in": "",
        "related_words": ""
    }
    print("2. Immediate Response (201 Created):")
    print(f"   {json.dumps(immediate_response, ensure_ascii=False, indent=2)}")
    
    # Step 3: Background enrichment happens
    print("\n3. Background Task Starts...")
    example_background_enrichment()
    
    # Step 4: Enriched data available on next GET
    enriched_response = {
        "character": "愛",
        "frequency": 100,
        "calls": 0,
        "meaning": "愛 (ài) significa \"amor\" em chinês...",
        "decomposition": "",  # Not used anymore
        "appears_in": "Uma mão (garra) que segura cuidadosamente o coração...",
        "related_words": "愛人 - amante, cônjuge\n愛好 - hobby, interesse..."
    }
    print("\n4. Later GET request returns enriched data:")
    print(f"   {json.dumps(enriched_response, ensure_ascii=False, indent=2)}")


if __name__ == "__main__":
    example_complete_flow()
