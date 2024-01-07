from typing import Callable

from dotenv import load_dotenv
from pydantic import Field, PostgresDsn
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    ENV: str = Field('env', validate_default=False)
    PYTHONPATH: str = Field('pythonpath', validate_default=False)
    LOG_LEVEL: str = Field('loglevel', validate_default=False)
    DATABASE_PG_URL: PostgresDsn = Field('databasepgurl', validate_default=False)
    REDIS_HOST: str = Field('redishost', validate_default=False)
    REDIS_PORT: str = Field('redisport', validate_default=False)
    WEB_APP_DEBUG: bool = Field('webappdebug', validate_default=False)
    WEB_APP_DESCRIPTION: str = Field('webappdescription', validate_default=False)
    WEB_APP_TITLE: str = Field('webapptitle', validate_default=False)
    WEB_APP_VERSION: str = Field('webappversion', validate_default=False)
    WEB_SERVER_HOST: str = Field('webserverhost', validate_default=False)
    WEB_SERVER_PORT: int = Field('webserverport', validate_default=False)
    WEB_SERVER_RELOAD: bool = Field('webserverreload', validate_default=False)


def _configure_initial_settings() -> Callable[[], Settings]:
    load_dotenv()
    
    settings = Settings()

    def fn() -> Settings:
        return settings

    return fn


get_settings = _configure_initial_settings()
