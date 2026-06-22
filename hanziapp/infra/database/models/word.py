from sqlalchemy.schema import CheckConstraint, Column, Table
from sqlalchemy.types import Integer, String, BigInteger

from hanziapp.infra.database.sqlalchemy import metadata


Word = Table(
    "word",
    metadata,
    Column("word", String, primary_key=True),  # Primary key
    Column("pinyin", String, nullable=False),
    Column("translation", String, nullable=False),
    Column("calls", Integer, default=0),
    Column("confidence_level", Integer, nullable=False),
    Column("tone_pair", BigInteger, nullable=True),
    Column("try", String, nullable=True),  # DB-only, not exposed in API/service
    Column("try_translation", String, nullable=True),  # DB-only, not exposed in API/service
    CheckConstraint("confidence_level >= 1 AND confidence_level <= 3", name="confidence_level_range"),
)
