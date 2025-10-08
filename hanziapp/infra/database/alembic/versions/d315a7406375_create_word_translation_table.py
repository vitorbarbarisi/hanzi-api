"""create_word_translation_table

Revision ID: d315a7406375
Revises: add_tone_pair_to_word_table
Create Date: 2025-10-07 15:03:55.907569

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'd315a7406375'
down_revision: Union[str, None] = 'add_tone_pair_to_word_table'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table(
        "word_translation",
        sa.Column("id", sa.Integer, primary_key=True, autoincrement=True),
        sa.Column("word", sa.String, nullable=False),
        sa.Column("translation", sa.String, nullable=False),
        sa.ForeignKeyConstraint(["word"], ["word.word"], name="fk_word_translation_word_word"),
        sa.PrimaryKeyConstraint("id", name="pk_word_translation"),
    )


def downgrade() -> None:
    op.drop_table("word_translation")
