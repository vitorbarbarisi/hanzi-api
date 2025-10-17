from typing import Optional

from sqlalchemy import func, select, insert, update as sqlalchemy_update
from sqlalchemy.ext.asyncio import AsyncSession

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)
from hanziapp.infra.database.models.hanzi import Hanzi as HanziModel
from hanziapp.infra.database.sqlalchemy import get_async_session

cache_hits = 0
cache_misses = 0

async def exists_by_id(character: str) -> bool:
    async with get_async_session() as session:
        query = select(func.count(HanziModel.c.character)).where(
            HanziModel.c.character == character
        )
        result = await session.execute(query)
        count = result.scalar()
        return bool(count)


async def fetch(character: str) -> Optional[Hanzi]:
    async with get_async_session() as session:
        query = select(HanziModel).where(HanziModel.c.character == character)
        result = await session.execute(query)
        row = result.first()
        
        if row:
            # Convert Row to dict for pydantic parsing
            row_dict = dict(row._mapping)
            return Hanzi.parse_obj(row_dict)
        return None


async def persist(dto: CreateHanziDto) -> Hanzi:
    values = {**dto.dict()}
    
    async with get_async_session() as session:
        query = insert(HanziModel).values(**values)
        await session.execute(query)
        # Session commit is handled by get_async_session context manager
        
    return Hanzi.parse_obj({**values})


async def update(
    dto: UpdateHanziDto, character: str
) -> Optional[Hanzi]:
    if not await exists_by_id(character):
        return None

    values = dto.dict(exclude_unset=True)
    
    async with get_async_session() as session:
        query = (
            sqlalchemy_update(HanziModel)
            .where(HanziModel.c.character == character)
            .values(**values)
        )
        await session.execute(query)
        # Session commit is handled by get_async_session context manager

    return await fetch(character)
