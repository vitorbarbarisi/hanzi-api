from typing import Optional, Protocol

from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
    UpdateHanziDto,
)


class HanziRepo(Protocol):
    async def fetch(self, id_: int) -> Optional[Hanzi]:
        ...

    async def persist(self, dto: CreateHanziDto) -> Hanzi:
        ...

    async def update(
        self, dto: UpdateHanziDto, character: str,
    ) -> Optional[Hanzi]:
        ...
