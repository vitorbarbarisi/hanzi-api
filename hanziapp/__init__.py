import uvicorn

from hanziapp.config.environment import get_settings
from hanziapp.api import init_app


_SETTINGS = get_settings()


web_app = init_app(_SETTINGS)


def start_web_server() -> None:
    settings = get_settings()
    uvicorn.run(
        "hanziapp:web_app",
        host=settings.WEB_SERVER_HOST,
        port=settings.WEB_SERVER_PORT,
        reload=settings.WEB_SERVER_RELOAD,
        log_level=settings.LOG_LEVEL,
        # workers=settings.WEB_SERVER_CONCURRENCY,
    )