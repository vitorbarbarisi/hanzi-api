from fastapi.applications import FastAPI

from hanziapp.api.routers import hanzi


def register_routers(app: FastAPI) -> FastAPI:
    app.include_router(hanzi.router, prefix="/hanzi-api")
    return app