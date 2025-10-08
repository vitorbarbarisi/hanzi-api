from typing import Optional

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    UpdateWordDto,
    WordWithTranslations,
)
from hanziapp.core.word.protocols import WordRepo, WordTranslationRepo


async def create(
    repo: WordRepo, dto: CreateWordDto,
) -> Word:
    result = await repo.persist(dto)
    return result


async def get(repo: WordRepo, word: str) -> Optional[Word]:
    result = await repo.fetch(word)
    return result


async def increment_count(repo: WordRepo, word: str) -> bool:
    """
    Domain service to increment the count of a word
    Returns True if successful, False otherwise
    """
    import asyncio
    from asyncpg.exceptions import InterfaceError
    
    max_retries = 3
    retry_delay = 0.1
    
    for attempt in range(max_retries):
        try:
            # Use a fresh connection for background task
            word_obj = await repo.fetch(word)
            if word_obj:
                await repo.update(UpdateWordDto(calls=word_obj.calls + 1), word)
                return True
            return False
        except InterfaceError as e:
            # Specific handling for connection pool errors
            print(f"Connection pool error on attempt {attempt + 1} for word '{word}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
            else:
                print(f"Connection pool exhausted for word '{word}' after {max_retries} attempts")
                return False
        except Exception as e:
            # General error handling
            print(f"Attempt {attempt + 1} failed incrementing count for word '{word}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
            else:
                print(f"Failed to increment count for word '{word}' after {max_retries} attempts")
                return False


async def get_with_translations(
    word_repo: WordRepo, 
    translation_repo: WordTranslationRepo, 
    word: str
) -> Optional[WordWithTranslations]:
    """
    Get word with all its translations
    """
    word_obj = await get(word_repo, word)
    if not word_obj:
        return None
    
    # Get all translations for this word
    from hanziapp.core.word.services import word_translation_service
    translations = await word_translation_service.get_translations_by_word(translation_repo, word)
    
    # Extract just the translation strings
    translation_strings = [t.translation for t in translations]
    
    # Create WordWithTranslations object
    return WordWithTranslations(
        word=word_obj.word,
        pinyin=word_obj.pinyin,
        translation=word_obj.translation,
        calls=word_obj.calls,
        confidence_level=word_obj.confidence_level,
        tone_pair=word_obj.tone_pair,
        translations=translation_strings
    )
