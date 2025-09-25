from fastapi.applications import FastAPI

from hanziapp.api.routers import hanzi, word


def register_routers(app: FastAPI) -> FastAPI:
    app.include_router(hanzi.router, prefix="/hanzi-api")
    app.include_router(word.router, prefix="/word-api")
    return app