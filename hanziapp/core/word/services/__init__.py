__all__ = (
    "create",
    "get",
    "increment_count",
    "get_translations_by_word",
    "add_translation",
    "remove_translation",
)


from .word_service import create, get, increment_count
from .word_translation_service import get_translations_by_word, add_translation, remove_translation
