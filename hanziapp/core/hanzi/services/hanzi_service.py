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
    try:
        hanzi = await repo.fetch(character)
        if hanzi:
            await repo.update(UpdateHanziDto(calls=hanzi.calls + 1), character)
            return True
        return False
    except Exception as e:
        # Log error but don't propagate - this is a background operation
        print(f"Error incrementing count for character '{character}': {e}")
        return False

@celery_app.task
async def enrich_hanzi(repo: HanziRepo, hanzi: Hanzi) -> None:
    hanzi.meaning = "meaning"
    hanzi.decomposition = "decomposition"
    hanzi.etymology = "etymology"
    hanzi.related_words = "related_words"
    await repo.update(
        UpdateHanziDto(
            meaning=hanzi.meaning,
            decomposition=hanzi.decomposition,
            etymology=hanzi.etymology,
            related_words=hanzi.related_words,
        ),
        hanzi.character,
    )
