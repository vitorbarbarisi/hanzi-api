__all__ = (
    "CreateWordDto",
    "Word",
    "UpdateWordDto",
    "WordWithTranslations",
    "CreateWordTranslationRequestDto",
    "CreateWordTranslationDto",
    "WordTranslation",
)


from .word import CreateWordDto, Word, UpdateWordDto, WordWithTranslations
from .word_translation import CreateWordTranslationRequestDto, CreateWordTranslationDto, WordTranslation
