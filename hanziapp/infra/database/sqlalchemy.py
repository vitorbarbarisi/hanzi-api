from contextlib import asynccontextmanager
from typing import AsyncGenerator

from sqlalchemy import MetaData
from sqlalchemy.ext.asyncio import (
    AsyncEngine,
    AsyncSession,
    async_sessionmaker,
    create_async_engine,
)

from hanziapp.config.environment import get_settings

_SETTINGS = get_settings()

# Configure modern SQLAlchemy 2.x async engine  
engine: AsyncEngine = create_async_engine(
    str(_SETTINGS.DATABASE_PG_URL).replace("postgresql://", "postgresql+asyncpg://"),
    echo=False,  # Set to True for SQL debug logging
    pool_size=10,  # Connection pool size
    max_overflow=20,  # Additional connections beyond pool_size
    pool_pre_ping=True,  # Validate connections before use
    pool_recycle=3600,  # Recycle connections after 1 hour
)

# Session maker for database operations
AsyncSessionLocal = async_sessionmaker(
    engine,
    class_=AsyncSession,
    expire_on_commit=False,
)

metadata = MetaData(
    naming_convention={
        "ix": "ix_%(column_0_label)s",
        "uq": "uq_%(table_name)s_%(column_0_name)s",
        "ck": "ck_%(table_name)s_%(constraint_name)s",
        "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
        "pk": "pk_%(table_name)s",
    }
)


@asynccontextmanager
async def get_async_session() -> AsyncGenerator[AsyncSession, None]:
    """Get an async database session."""
    async with AsyncSessionLocal() as session:
        try:
            yield session
            await session.commit()
        except Exception:
            await session.rollback()
            raise
        finally:
            await session.close()


@asynccontextmanager
async def database_context():
    """Context manager for database lifecycle."""
    # Engine handles connections automatically in SQLAlchemy 2.x
    yield engine


async def connect_database():
    """Initialize database connection (handled automatically by engine)."""
    # In SQLAlchemy 2.x, connections are managed automatically
    pass


async def disconnect_database():
    """Clean up database connections."""
    await engine.dispose()


def init_database() -> None:
    """Initialize database schema (for development)."""
    import hanziapp.infra.database.models  # noqa: F401
    
    # Note: In production, use Alembic migrations instead
    # This is just for development convenience
