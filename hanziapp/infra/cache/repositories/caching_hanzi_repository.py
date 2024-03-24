from typing import Iterable, Optional

from hanziapp.infra.database.repositories import database_hanzi_repository as DatabaseHanziRepo
from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.infra.cache.redis import cache

cache_hits = 0
cache_misses = 0

async def fetch(character: str) -> Optional[Hanzi]:
    global cache_hits, cache_misses
    result = cache.get(character)
    if result is None:
        hanzi = await DatabaseHanziRepo.fetch(character)
        cache_misses += 1
        if not hanzi:
            return None
        cache.set(character, hanzi.to_json())
        return hanzi    
    cache_hits += 1
    return Hanzi.from_json(result)
    
async def persist(dto: CreateHanziDto) -> Hanzi:
    return await DatabaseHanziRepo.persist(dto)

async def update(
    dto: UpdateHanziDto, character: str
) -> Optional[Hanzi]:
    return await DatabaseHanziRepo.update(dto, character)
