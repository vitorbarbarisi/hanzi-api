from typing import List

from hanziapp.core.word.entities.word_translation import (
    CreateWordTranslationDto,
    WordTranslation,
)
from hanziapp.infra.database.models.word_translation import WordTranslation as WordTranslationModel
from hanziapp.infra.database.sqlalchemy import database


async def fetch_by_word(word: str) -> List[WordTranslation]:
    query = (
        WordTranslationModel.select()
        .where(WordTranslationModel.c.word == word)
        .order_by(WordTranslationModel.c.id)
    )

    result = await database.fetch_all(query)
    return [WordTranslation.parse_obj(dict(row)) for row in result]


async def persist(dto: CreateWordTranslationDto) -> WordTranslation:
    values = {**dto.dict()}
    query = WordTranslationModel.insert().values(**values)
    result = await database.execute(query)
    
    # Get the inserted record
    inserted_query = (
        WordTranslationModel.select()
        .where(WordTranslationModel.c.id == result)
    )
    inserted_record = await database.fetch_one(inserted_query)
    
    return WordTranslation.parse_obj(dict(inserted_record))


async def delete(translation_id: int) -> bool:
    query = (
        WordTranslationModel.delete()
        .where(WordTranslationModel.c.id == translation_id)
    )
    result = await database.execute(query)
    return result > 0

