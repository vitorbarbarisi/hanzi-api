from typing import List

from fastapi import BackgroundTasks
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse  # type: ignore
from fastapi.routing import APIRouter

from hanziapp.api.container import get_dependencies
from hanziapp.core.word.entities.word import (
    CreateWordDto,
    Word,
)
from hanziapp.core.word.services import word_service
from hanziapp.infra.database.sqlalchemy import database


repo = get_dependencies().word_repo
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
@database.transaction()
async def create(dto: CreateWordDto):
    return await word_service.create(repo, dto)


@router.get(
    "/{word}",
    response_class=JSONResponse,
    response_model=Word,
    status_code=200,
    responses={
        200: {"description": "Word found"},
        404: {"description": "Word not found"},
    },
)
async def get(word: str, background_tasks: BackgroundTasks):
    item = await word_service.get(repo, word)
    if not item:
        return JSONResponse(content={"description": "Word not found"}, status_code=404)
    
    # Add background task to increment count using domain service
    background_tasks.add_task(word_service.increment_count, repo, word)
    
    return item
