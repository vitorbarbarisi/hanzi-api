from dataclasses import dataclass
from typing import Callable, cast

from hanziapp.core.hanzi.protocols import HanziRepo
# from hanziapp.infra.database.repositories import database_hanzi_repository
from hanziapp.infra.cache.repositories import caching_hanzi_repository


@dataclass(frozen=True)
class Dependencies:
    hanzi_repo: HanziRepo


def _build_dependencies() -> Callable[[], Dependencies]:
    deps = Dependencies(
        hanzi_repo=cast(HanziRepo, caching_hanzi_repository),
    )

    def fn() -> Dependencies:
        return deps

    return fn


get_dependencies = _build_dependencies()
