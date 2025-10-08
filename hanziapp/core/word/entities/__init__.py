__all__ = (
    "CreateWordDto",
    "Word",
    "UpdateWordDto",
    "CreateWordTranslationRequestDto",
    "CreateWordTranslationDto",
    "WordTranslation",
)


from .word import CreateWordDto, Word, UpdateWordDto
from .word_translation import CreateWordTranslationRequestDto, CreateWordTranslationDto, WordTranslation
