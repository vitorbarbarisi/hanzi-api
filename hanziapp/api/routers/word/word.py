from typing import List

from fastapi import BackgroundTasks
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse  # type: ignore
from fastapi.routing import APIRouter

from hanziapp.api.container import get_dependencies
from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
    WordWithTranslations,
)
from hanziapp.core.word.entities.word_translation import (
    CreateWordTranslationRequestDto,
    CreateWordTranslationDto,
    WordTranslation,
)
from hanziapp.core.word.services import word_service, word_translation_service
# Using SQLAlchemy 2.x - transactions handled by repositories


repo = get_dependencies().word_repo
word_translation_repo = get_dependencies().word_translation_repo
router = APIRouter()



# Health check endpoint
@router.get(
    "/health",
    response_class=JSONResponse,
    status_code=200,
    responses={200: {"description": "API is healthy"}},
)
async def health_check():
    """Health check endpoint to verify if the API is running."""
    return JSONResponse(
        content={"status": "healthy", "message": "Word API is running"},
        status_code=200
    )


# Handlers
@router.post(
    "/",
    response_class=JSONResponse,
    response_model=Word,
    status_code=201,
    responses={201: {"description": "Word created"}},
)
async def create(dto: CreateWordDto):
    return await word_service.create(repo, dto)


@router.get(
    "/{word}",
    response_class=JSONResponse,
    response_model=WordWithTranslations,
    status_code=200,
    responses={
        200: {"description": "Word found"},
        404: {"description": "Word not found"},
    },
)
async def get(word: str, background_tasks: BackgroundTasks):
    item = await word_service.get_with_translations(repo, word_translation_repo, word)
    if not item:
        return JSONResponse(content={"description": "Word not found"}, status_code=404)
    
    # Add background task to increment count using domain service
    background_tasks.add_task(word_service.increment_count, repo, word)
    
    return item


@router.put(
    "/{word}/translations",
    response_class=JSONResponse,
    response_model=WordTranslation,
    status_code=201,
    responses={
        201: {"description": "Translation added successfully"},
        404: {"description": "Word not found"},
    },
)
async def add_translation(word: str, dto: CreateWordTranslationRequestDto):
    # Verify if word exists
    word_obj = await word_service.get(repo, word)
    if not word_obj:
        return JSONResponse(content={"description": "Word not found"}, status_code=404)
    
    # Create new DTO with the word from the URL parameter
    new_dto = CreateWordTranslationDto(word=word, translation=dto.translation)
    
    return await word_translation_service.add_translation(word_translation_repo, new_dto)


@router.get(
    "/{word}/translations",
    response_class=JSONResponse,
    response_model=List[WordTranslation],
    status_code=200,
    responses={
        200: {"description": "Translations found"},
        404: {"description": "Word not found"},
    },
)
async def get_translations(word: str):
    # Verify if word exists
    word_obj = await word_service.get(repo, word)
    if not word_obj:
        return JSONResponse(content={"description": "Word not found"}, status_code=404)
    
    return await word_translation_service.get_translations_by_word(word_translation_repo, word)
