from typing import List, Optional, Protocol

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    UpdateWordDto,
)


class WordRepo(Protocol):
    async def fetch(self, word: str) -> Optional[Word]:
        ...

    async def persist(self, dto: CreateWordDto) -> Word:
        ...

    async def update(
        self, dto: UpdateWordDto, word: str,
    ) -> Optional[Word]:
        ...

    async def increment_calls(self, word: str) -> bool:
        ...

    async def increment_calls_text(self, word: str) -> bool:
        ...

    async def search_by_word_like(self, q: str) -> List[Word]:
        ...

    async def search_by_translation_like(self, q: str) -> List[Word]:
        ...
