from typing import Optional, List

from sqlalchemy import func, select, insert, update as sqlalchemy_update, or_

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    UpdateWordDto,
)
from hanziapp.infra.database.models.word import Word as WordModel
from hanziapp.infra.database.models.word_translation import WordTranslation as WordTranslationModel
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
    if not values:
        return await fetch(word)

    async with get_async_session() as session:
        query = (
            sqlalchemy_update(WordModel)
            .where(WordModel.c.word == word)
            .values(**values)
        )
        await session.execute(query)

    return await fetch(word)


async def increment_calls(word: str) -> bool:
    """Atomically increment the calls counter, safe under concurrency."""
    async with get_async_session() as session:
        query = (
            sqlalchemy_update(WordModel)
            .where(WordModel.c.word == word)
            .values(calls=func.coalesce(WordModel.c.calls, 0) + 1)
        )
        result = await session.execute(query)
        return result.rowcount > 0


async def search_by_word_like(q: str) -> List[Word]:
    async with get_async_session() as session:
        query = (
            select(WordModel)
            .where(WordModel.c.word.like(f"%{q}%"))
            .order_by(WordModel.c.calls.desc(), WordModel.c.word)
        )
        result = await session.execute(query)
        rows = result.fetchall()
        return [Word.parse_obj(dict(row._mapping)) for row in rows]


async def search_by_translation_like(q: str) -> List[Word]:
    async with get_async_session() as session:
        # Use EXISTS to avoid duplicates from JOIN and allow ordering by calls desc
        translations_exists = (
            select(WordTranslationModel.c.id)
            .where(
                (WordTranslationModel.c.word == WordModel.c.word)
                & (WordTranslationModel.c.translation.ilike(f"%{q}%"))
            )
            .exists()
        )

        query = (
            select(WordModel)
            .where(
                or_(
                    WordModel.c.translation.ilike(f"%{q}%"),
                    translations_exists,
                )
            )
            .order_by(WordModel.c.calls.desc(), WordModel.c.word)
        )
        result = await session.execute(query)
        rows = result.fetchall()
        return [Word.parse_obj(dict(row._mapping)) for row in rows]
