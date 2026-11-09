"""add correct_count to word table

Revision ID: add_correct_count_word
Revises: add_calls_text_word
Create Date: 2026-11-08 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'add_correct_count_word'
down_revision: Union[str, None] = 'add_calls_text_word'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Add the training correct-answer counter to word table.

    NOT NULL with a server_default, like calls_text: existing rows backfill to 0
    and Word.parse_obj never sees a NULL for its plain-int field.
    """
    op.add_column(
        'word',
        sa.Column('correct_count', sa.Integer(), nullable=False, server_default='0'),
    )


def downgrade() -> None:
    """Remove correct_count column from word table."""
    op.drop_column('word', 'correct_count')
