from typing import Iterable, Optional, Union

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.core.hanzi.protocols import HanziRepo
from hanziapp.infra.llm import OpenAiIntegration, DeepSeekIntegration


async def create(
    repo: HanziRepo, dto: CreateHanziDto,
) -> Hanzi:
    result = await repo.persist(dto)
    return result

async def get(repo: HanziRepo, character: str) -> Optional[Hanzi]:
    result = await repo.fetch(character)
    print(f"Cache hits: {repo.cache_hits}")
    print(f"Cache misses: {repo.cache_misses}")
    # if result:
    #     await repo.update(UpdateHanziDto(calls=result.calls + 1 or 1), result.character)
    return result

async def increment_count(repo: HanziRepo, character: str) -> bool:
    """
    Domain service to increment the count of a hanzi character
    Returns True if successful, False otherwise
    """
    import asyncio
    from asyncpg.exceptions import InterfaceError
    
    max_retries = 3
    retry_delay = 0.1
    
    for attempt in range(max_retries):
        try:
            # Use a fresh connection for background task
            hanzi = await repo.fetch(character)
            if hanzi:
                await repo.update(UpdateHanziDto(calls=hanzi.calls + 1), character)
                return True
            return False
        except InterfaceError as e:
            # Specific handling for connection pool errors
            print(f"Connection pool error on attempt {attempt + 1} for character '{character}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
            else:
                print(f"Connection pool exhausted for character '{character}' after {max_retries} attempts")
                return False
        except Exception as e:
            # General error handling
            print(f"Attempt {attempt + 1} failed incrementing count for character '{character}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
            else:
                print(f"Failed to increment count for character '{character}' after {max_retries} attempts")
                return False

async def enrich_hanzi_background(repo: HanziRepo, character: str) -> None:
    """
    Background task to enrich hanzi data using LLM integrations.
    
    Args:
        repo: The HanziRepo instance
        character: The Chinese character to enrich
    """
    try:
        import json
        
        # Initialize LLM integrations
        openai_integration = OpenAiIntegration(character)
        deepseek_integration = DeepSeekIntegration(character)
        
        print(f"Starting LLM enrichment for character: {character}")
        
        # Get data from LLMs
        meaning = openai_integration.get_meaning()
        related_words = openai_integration.get_related_words()
        
        # Get decomposition from DeepSeek (returns JSON)
        decomposition_json = deepseek_integration.get_decomposition()
        decomposition_data = json.loads(decomposition_json)
        decomposition = decomposition_data.get("decomposition", "")
        
        print(f"Enrichment data gathered for {character}")
        print(f"Meaning: {meaning[:100]}...")
        print(f"Related words: {related_words[:100]}...")
        print(f"Decomposition: {decomposition[:100]}...")
        
        # Update hanzi record in database
        update_dto = UpdateHanziDto(
            meaning=meaning,
            related_words=related_words,
            decomposition=decomposition,
        )
        
        result = await repo.update(update_dto, character)
        
        if result:
            print(f"Successfully enriched hanzi: {character}")
        else:
            print(f"Failed to update hanzi: {character} - character not found")
            
    except Exception as e:
        print(f"Error enriching hanzi {character}: {str(e)}")
        import traceback
        traceback.print_exc()
