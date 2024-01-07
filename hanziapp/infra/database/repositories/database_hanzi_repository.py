from typing import Iterable, Optional

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.infra.database.models.hanzi import Hanzi as HanziModel
from hanziapp.infra.database.sqlalchemy import database

cache_hits = 0
cache_misses = 0

async def exists_by_id(character: str) -> bool:
    query = HanziModel.count().where(HanziModel.c.character == character)
    return bool(await database.execute(query))


async def fetch(character: str) -> Optional[Hanzi]:
    query = (
        HanziModel.select()
        .where(HanziModel.c.character == character)
    )

    result = await database.fetch_one(query)
    return Hanzi.parse_obj(dict(result)) if result else None


async def persist(dto: CreateHanziDto) -> Hanzi:
    values = {**dto.dict()}    
    query = HanziModel.insert().values(**values)
    await database.execute(query)

    return Hanzi.parse_obj({**values})


async def update(
    dto: UpdateHanziDto, character: str
) -> Optional[Hanzi]:
    if not await exists_by_id(character):
        return None

    values = dto.dict(exclude_unset=True)
    query = (
        HanziModel.update()
        .where(HanziModel.c.character == character)
        .values(**values)
    )
    await database.execute(query)

    return await fetch(character)
