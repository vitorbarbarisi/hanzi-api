from typing import Optional

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    UpdateWordDto,
)
from hanziapp.infra.database.models.word import Word as WordModel
from hanziapp.infra.database.sqlalchemy import database


async def exists_by_id(word: str) -> bool:
    query = WordModel.count().where(WordModel.c.word == word)
    return bool(await database.execute(query))


async def fetch(word: str) -> Optional[Word]:
    query = (
        WordModel.select()
        .where(WordModel.c.word == word)
    )

    result = await database.fetch_one(query)
    return Word.parse_obj(dict(result)) if result else None


async def persist(dto: CreateWordDto) -> Word:
    values = {**dto.dict()}    
    query = WordModel.insert().values(**values)
    await database.execute(query)

    return Word.parse_obj({**values})


async def update(
    dto: UpdateWordDto, word: str
) -> Optional[Word]:
    if not await exists_by_id(word):
        return None

    values = dto.dict(exclude_unset=True)
    query = (
        WordModel.update()
        .where(WordModel.c.word == word)
        .values(**values)
    )
    await database.execute(query)

    return await fetch(word)
