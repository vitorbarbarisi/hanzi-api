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
from hanziapp.infra.database.sqlalchemy import database


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
@database.transaction()
async def create(dto: CreateHanziDto):
    return await hanzi_service.create(repo, dto)

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
