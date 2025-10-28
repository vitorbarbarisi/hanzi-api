import asyncio
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


def web_server():
    # Lazy import to avoid importing uvicorn (and web server deps) at package import time
    from hanziapp import start_web_server
    start_web_server()
