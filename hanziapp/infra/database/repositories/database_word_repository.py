from typing import Optional

from sqlalchemy import func, select, insert, update as sqlalchemy_update

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    UpdateWordDto,
)
from hanziapp.infra.database.models.word import Word as WordModel
from hanziapp.infra.database.sqlalchemy import get_async_session


async def exists_by_id(word: str) -> bool:
    async with get_async_session() as session:
        query = select(func.count(WordModel.c.word)).where(
            WordModel.c.word == word
        )
        result = await session.execute(query)
        count = result.scalar()
        return bool(count)


async def fetch(word: str) -> Optional[Word]:
    async with get_async_session() as session:
        query = select(WordModel).where(WordModel.c.word == word)
        result = await session.execute(query)
        row = result.first()
        
        if row:
            row_dict = dict(row._mapping)
            return Word.parse_obj(row_dict)
        return None


async def persist(dto: CreateWordDto) -> Word:
    values = {**dto.dict()}
    
    async with get_async_session() as session:
        query = insert(WordModel).values(**values)
        await session.execute(query)
        
    return Word.parse_obj({**values})


async def update(
    dto: UpdateWordDto, word: str
) -> Optional[Word]:
    if not await exists_by_id(word):
        return None

    values = dto.dict(exclude_unset=True)
    
    async with get_async_session() as session:
        query = (
            sqlalchemy_update(WordModel)
            .where(WordModel.c.word == word)
            .values(**values)
        )
        await session.execute(query)

    return await fetch(word)
