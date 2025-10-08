from typing import List

from hanziapp.core.word.entities.word_translation import (
    CreateWordTranslationDto,
    WordTranslation,
)
from hanziapp.core.word.protocols import WordTranslationRepo


async def get_translations_by_word(
    repo: WordTranslationRepo, word: str
) -> List[WordTranslation]:
    result = await repo.fetch_by_word(word)
    return result


async def add_translation(
    repo: WordTranslationRepo, dto: CreateWordTranslationDto
) -> WordTranslation:
    result = await repo.persist(dto)
    return result


async def remove_translation(
    repo: WordTranslationRepo, translation_id: int
) -> bool:
    result = await repo.delete(translation_id)
    return result

