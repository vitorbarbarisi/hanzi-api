from typing import Iterable, Optional, Union

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.core.hanzi.protocols import HanziRepo
from hanziapp.infra.broker.celery import celery_app


async def create(
    repo: HanziRepo, dto: CreateHanziDto,
) -> Hanzi:
    result = await repo.persist(dto)
    # enrich_hanzi.delay(result)
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

@celery_app.task
async def enrich_hanzi(repo: HanziRepo, hanzi: Hanzi) -> None:
    hanzi.meaning = "meaning"
    hanzi.decomposition = "decomposition"
    hanzi.appears_in = "appears_in"
    hanzi.related_words = "related_words"
    await repo.update(
        UpdateHanziDto(
            meaning=hanzi.meaning,
            decomposition=hanzi.decomposition,
            appears_in=hanzi.appears_in,
            related_words=hanzi.related_words,
        ),
        hanzi.character,
    )
