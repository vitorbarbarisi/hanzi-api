"""create word table

Revision ID: create_word_table
Revises: fd4ea7c08a33
Create Date: 2024-01-22 00:46:39.386686

"""
import sqlalchemy as sa

from typing import Sequence, Union
from alembic import op
from sqlalchemy import Table, MetaData

# revision identifiers, used by Alembic.
revision: str = 'create_word_table'
down_revision: Union[str, None] = 'fd4ea7c08a33'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade():
    engine = op.get_bind()
    metadata = MetaData(engine)

    if not Table('word', metadata, autoload=True).exists():
        op.create_table(
            "word",
            sa.Column("word", sa.String, primary_key=True),
            sa.Column("pinyin", sa.String, nullable=False),
            sa.Column("translation", sa.String, nullable=False),
            sa.Column("calls", sa.Integer, default=0),
            sa.Column("confidence_level", sa.Integer, nullable=False),
            sa.CheckConstraint(
                "confidence_level >= 1 AND confidence_level <= 3",
                name=op.f("confidence_level_range"),
            ),
            sa.PrimaryKeyConstraint("word", name=op.f("pk_word")),
            if_not_exists=True
        )


def downgrade():
    op.drop_table("word")
