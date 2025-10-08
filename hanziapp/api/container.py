from dataclasses import dataclass
from typing import Callable, cast

from hanziapp.core.hanzi.protocols import HanziRepo
from hanziapp.core.word.protocols import WordRepo, WordTranslationRepo
# from hanziapp.infra.database.repositories import database_hanzi_repository
from hanziapp.infra.cache.repositories import caching_hanzi_repository
from hanziapp.infra.database.repositories import database_word_repository, database_word_translation_repository


@dataclass(frozen=True)
class Dependencies:
    hanzi_repo: HanziRepo
    word_repo: WordRepo
    word_translation_repo: WordTranslationRepo


def _build_dependencies() -> Callable[[], Dependencies]:
    deps = Dependencies(
        hanzi_repo=cast(HanziRepo, caching_hanzi_repository),
        word_repo=cast(WordRepo, database_word_repository),
        word_translation_repo=cast(WordTranslationRepo, database_word_translation_repository),
    )

    def fn() -> Dependencies:
        return deps

    return fn


get_dependencies = _build_dependencies()
