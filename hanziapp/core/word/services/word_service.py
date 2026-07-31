import asyncio
import re
from typing import Optional, List

from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
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


async def _increment_counter_with_retry(increment_fn, word: str, counter_name: str) -> bool:
    """
    Run an atomic counter increment, retrying with exponential backoff.
    Returns True if successful, False otherwise
    """
    max_retries = 3
    retry_delay = 0.1

    for attempt in range(max_retries):
        try:
            return await increment_fn(word)
        except Exception as e:
            print(f"Attempt {attempt + 1} failed incrementing {counter_name} for word '{word}': {e}")
            if attempt < max_retries - 1:
                await asyncio.sleep(retry_delay)
                retry_delay *= 2  # Exponential backoff
    print(f"Failed to increment {counter_name} for word '{word}' after {max_retries} attempts")
    return False


async def increment_count(repo: WordRepo, word: str) -> bool:
    """Domain service to increment the access count of a word."""
    return await _increment_counter_with_retry(repo.increment_calls, word, "calls")


async def increment_text_count(repo: WordRepo, word: str) -> bool:
    """Domain service to increment the text-context access count of a word."""
    return await _increment_counter_with_retry(repo.increment_calls_text, word, "calls_text")


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
        calls_text=word_obj.calls_text,
        confidence_level=word_obj.confidence_level,
        tone_pair=word_obj.tone_pair,
        translations=translation_strings
    )


async def search(repo: WordRepo, q: str) -> List[Word]:
    """
    Search words by query.
    - If q contains any CJK character, search by Word.word LIKE %q%
    - Otherwise, search by Word.translation LIKE %q%
    """
    contains_cjk = re.search(r"[\u4e00-\u9fff]", q) is not None
    if contains_cjk:
        return await repo.search_by_word_like(q)
    return await repo.search_by_translation_like(q)
