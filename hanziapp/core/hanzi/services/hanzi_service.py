import asyncio
from typing import Optional

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.core.hanzi.protocols import HanziRepo
from hanziapp.infra.llm import DeepSeekIntegration
from hanziapp.infra.scraper import HanziCraftScraper


async def create(
    repo: HanziRepo, dto: CreateHanziDto,
) -> Hanzi:
    result = await repo.persist(dto)
    return result

async def get(repo: HanziRepo, character: str) -> Optional[Hanzi]:
    result = await repo.fetch(character)
    return result

async def increment_count(repo: HanziRepo, character: str) -> bool:
    """
    Domain service to increment the count of a hanzi character.
    Uses an atomic UPDATE so concurrent requests don't lose increments.
    Returns True if successful, False otherwise
    """
    max_retries = 3
    retry_delay = 0.1

    for attempt in range(max_retries):
        try:
            return await repo.increment_calls(character)
        except Exception as e:
            print(f"Attempt {attempt + 1} failed incrementing count for character '{character}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
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

        # Initialize LLM integration
        deepseek_integration = DeepSeekIntegration(character)

        print(f"Starting LLM enrichment for character: {character}")

        # The LLM and scraper calls below are synchronous/blocking (up to
        # 60s each). This task runs on the event loop, so run them in
        # worker threads to keep the API responsive during enrichment.
        meaning = await asyncio.to_thread(deepseek_integration.get_meaning)
        related_words = await asyncio.to_thread(deepseek_integration.get_related_words)

        # Get decomposition from DeepSeek (returns JSON)
        decomposition_json = await asyncio.to_thread(deepseek_integration.get_decomposition)
        decomposition_data = json.loads(decomposition_json)
        decomposition = decomposition_data.get("decomposition", "")
        decomposition_meaning = decomposition_data.get("decomposition_meaning", "")

        # Scrape the optional "Appears In" section from HanziCraft.
        # Returns "" when the section is absent or the page is unreachable.
        appears_in = await asyncio.to_thread(HanziCraftScraper(character).get_appears_in)

        print(f"Enrichment data gathered for {character}")
        print(f"Meaning: {meaning[:100]}...")
        print(f"Related words: {related_words[:100]}...")
        print(f"Decomposition: {decomposition[:100]}...")
        print(f"Decomposition meaning: {decomposition_meaning[:100]}...")
        print(f"Appears in: {appears_in[:100]}...")

        # Update hanzi record in database. The repository uses
        # exclude_unset=True, so only pass appears_in when the scrape returned
        # data to avoid overwriting an existing value with an empty string.
        update_fields = dict(
            meaning=meaning,
            related_words=related_words,
            decomposition=decomposition,
            decomposition_meaning=decomposition_meaning,
        )
        if appears_in:
            update_fields["appears_in"] = appears_in

        update_dto = UpdateHanziDto(**update_fields)
        
        result = await repo.update(update_dto, character)
        
        if result:
            print(f"Successfully enriched hanzi: {character}")
        else:
            print(f"Failed to update hanzi: {character} - character not found")
            
    except Exception as e:
        print(f"Error enriching hanzi {character}: {str(e)}")
        import traceback
        traceback.print_exc()
