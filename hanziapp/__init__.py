def start_web_server() -> None:
    # Lazy imports to avoid heavy deps on package import
    from hanziapp.config.environment import get_settings
    from hanziapp.api import init_app
    import uvicorn

    settings = get_settings()
    app = init_app(settings)

    # When reload is enabled, uvicorn requires an import string and ignores workers
    if settings.WEB_SERVER_RELOAD:
        uvicorn.run(
            "hanziapp.main:app",
            host=settings.WEB_SERVER_HOST,
            port=settings.WEB_SERVER_PORT,
            reload=True,
            log_level=settings.LOG_LEVEL,
            workers=1,
        )
    else:
        uvicorn.run(
            app,
            host=settings.WEB_SERVER_HOST,
            port=settings.WEB_SERVER_PORT,
            reload=False,
            log_level=settings.LOG_LEVEL,
            workers=settings.WEB_SERVER_CONCURRENCY,
        )