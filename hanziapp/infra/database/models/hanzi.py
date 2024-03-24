from sqlalchemy.schema import CheckConstraint, Column, Table
from sqlalchemy.types import Integer, String

from hanziapp.infra.database.sqlalchemy import metadata


Hanzi = Table(
    "hanzi",
    metadata,
    Column("character", String(length=1), primary_key=True),  # Chinese character
    Column("frequency", Integer, nullable=False),
    Column("calls", Integer, default=0),
    Column("meaning", String, default=""),
    Column("decomposition", String, default=""),
    Column("etymology", String, default=""),
    Column("related_words", String, default=""),
    CheckConstraint("length(character) = 1", name="character_length"),
)
