from fastapi.routing import APIRouter

from . import hanzi


def _build_router() -> APIRouter:
    rt = APIRouter()
    rt.include_router(hanzi.router, prefix="/hanzi", tags=["Hanzi"])
    return rt


router = _build_router()