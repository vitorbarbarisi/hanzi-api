from typing import List

from fastapi import BackgroundTasks
from fastapi.param_functions import Depends
from fastapi.responses import JSONResponse  # type: ignore
from fastapi.routing import APIRouter

from hanziapp.api.container import get_dependencies
from hanziapp.core.hanzi.entities.hanzi import (
    CreateHanziDto,
    Hanzi,
)
from hanziapp.core.hanzi.services import hanzi_service
# Using SQLAlchemy 2.x - transactions handled by repositories


repo = get_dependencies().hanzi_repo
router = APIRouter()


# Handlers
@router.post(
    "",
    response_class=JSONResponse,
    response_model=Hanzi,
    status_code=201,
    responses={201: {"description": "Hanzi created"}},
)
async def create(dto: CreateHanziDto, background_tasks: BackgroundTasks):
    result = await hanzi_service.create(repo, dto)
    
    # Add background task to enrich hanzi with LLM data
    background_tasks.add_task(hanzi_service.enrich_hanzi_background, repo, result.character)
    
    return result

@router.put(
    "/{character}/enrich",
    response_class=JSONResponse,
    status_code=202,
    responses={
        202: {"description": "Enrichment task started"},
        404: {"description": "Hanzi not found"},
    },
)
async def enrich(character: str, background_tasks: BackgroundTasks):
    """Manually trigger LLM enrichment for an existing hanzi character."""
    # Check if hanzi exists
    existing_hanzi = await hanzi_service.get(repo, character)
    if not existing_hanzi:
        return JSONResponse(
            content={"error": "Hanzi not found", "character": character}, 
            status_code=404
        )
    
    # Add background task to enrich hanzi with LLM data
    background_tasks.add_task(hanzi_service.enrich_hanzi_background, repo, character)
    
    return JSONResponse(
        content={
            "message": "Enrichment task started", 
            "character": character,
            "status": "processing"
        }, 
        status_code=202
    )

@router.get(
    "/{character}",
    response_class=JSONResponse,
    response_model=Hanzi,
    status_code=200,
    responses={
        200: {"description": "Hanzi found"},
        404: {"description": "Hanzi not found"},
    },
)
async def get(character: str, background_tasks: BackgroundTasks):
    item = await hanzi_service.get(repo, character)
    if not item:
        return JSONResponse(content={"description": "Hanzi not found"}, status_code=404)
    
    # Add background task to increment count using domain service
    background_tasks.add_task(hanzi_service.increment_count, repo, character)
    
    return item
