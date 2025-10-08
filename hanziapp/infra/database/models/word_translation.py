from sqlalchemy.schema import Column, ForeignKey, Table
from sqlalchemy.types import Integer, String

from hanziapp.infra.database.sqlalchemy import metadata


WordTranslation = Table(
    "word_translation",
    metadata,
    Column("id", Integer, primary_key=True, autoincrement=True),
    Column("word", String, ForeignKey("word.word"), nullable=False),
    Column("translation", String, nullable=False),
)

