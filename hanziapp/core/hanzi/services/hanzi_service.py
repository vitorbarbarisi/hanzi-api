from typing import Iterable, Optional, Union

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.core.hanzi.protocols import HanziRepo


async def create(
    repo: HanziRepo, dto: CreateHanziDto,
) -> Hanzi:
    return await repo.persist(dto)

async def get(repo: HanziRepo, character: str) -> Optional[Hanzi]:
    result = await repo.fetch(character)
    print(f"Cache hits: {repo.cache_hits}")
    print(f"Cache misses: {repo.cache_misses}")
    # if result:
    #     await repo.update(UpdateHanziDto(calls=result.calls + 1 or 1), result.character)
    return result
