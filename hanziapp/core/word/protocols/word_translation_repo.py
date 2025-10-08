from typing import List, Optional, Protocol

from hanziapp.core.word.entities.word_translation import (
    CreateWordTranslationDto,
    WordTranslation,
)


class WordTranslationRepo(Protocol):
    async def fetch_by_word(self, word: str) -> List[WordTranslation]:
        ...

    async def persist(self, dto: CreateWordTranslationDto) -> WordTranslation:
        ...

    async def delete(self, translation_id: int) -> bool:
        ...

