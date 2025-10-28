from hanziapp.config.environment import get_settings
from hanziapp.api import init_app


# Expose FastAPI app for uvicorn (import string: "hanziapp.main:app")
app = init_app(get_settings())