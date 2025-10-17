from typing import List

from sqlalchemy import select, insert, delete as sqlalchemy_delete

from hanziapp.core.word.entities.word_translation import (
    CreateWordTranslationDto,
    WordTranslation,
)
from hanziapp.infra.database.models.word_translation import WordTranslation as WordTranslationModel
from hanziapp.infra.database.sqlalchemy import get_async_session


async def fetch_by_word(word: str) -> List[WordTranslation]:
    async with get_async_session() as session:
        query = (
            select(WordTranslationModel)
            .where(WordTranslationModel.c.word == word)
            .order_by(WordTranslationModel.c.id)
        )
        
        result = await session.execute(query)
        rows = result.fetchall()
        return [WordTranslation.parse_obj(dict(row._mapping)) for row in rows]


async def persist(dto: CreateWordTranslationDto) -> WordTranslation:
    values = {**dto.dict()}
    
    async with get_async_session() as session:
        query = insert(WordTranslationModel).values(**values)
        result = await session.execute(query)
        insert_id = result.inserted_primary_key[0]
        
        # Get the inserted record
        inserted_query = select(WordTranslationModel).where(
            WordTranslationModel.c.id == insert_id
        )
        inserted_result = await session.execute(inserted_query)
        inserted_record = inserted_result.first()
        
        return WordTranslation.parse_obj(dict(inserted_record._mapping))


async def delete(translation_id: int) -> bool:
    async with get_async_session() as session:
        query = sqlalchemy_delete(WordTranslationModel).where(
            WordTranslationModel.c.id == translation_id
        )
        result = await session.execute(query)
        return result.rowcount > 0

