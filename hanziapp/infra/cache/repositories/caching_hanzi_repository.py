from typing import Optional

from hanziapp.infra.database.repositories import database_hanzi_repository as DatabaseHanziRepo
from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)

# Cache em memória usando dicionário Python
memory_cache = {}

cache_hits = 0
cache_misses = 0

async def fetch(character: str) -> Optional[Hanzi]:
    global cache_hits, cache_misses
    result = memory_cache.get(character)
    if result is None:
        hanzi = await DatabaseHanziRepo.fetch(character)
        cache_misses += 1
        if not hanzi:
            return None
        memory_cache[character] = hanzi.to_json()
        return hanzi    
    cache_hits += 1
    return Hanzi.from_json(result)
    
async def persist(dto: CreateHanziDto) -> Hanzi:
    return await DatabaseHanziRepo.persist(dto)

async def update(
    dto: UpdateHanziDto, character: str
) -> Optional[Hanzi]:
    # Invalidate cache before updating
    if character in memory_cache:
        del memory_cache[character]
    
    result = await DatabaseHanziRepo.update(dto, character)

    # Update cache with fresh data
    if result:
        memory_cache[character] = result.to_json()

    return result

async def increment_calls(character: str) -> bool:
    result = await DatabaseHanziRepo.increment_calls(character)
    # Drop the cached entry so the next fetch sees the fresh calls count
    if result:
        memory_cache.pop(character, None)
    return result
