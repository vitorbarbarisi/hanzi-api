"""add calls_text to word table

Revision ID: add_calls_text_word
Revises: add_try_columns_word
Create Date: 2026-07-08 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'add_calls_text_word'
down_revision: Union[str, None] = 'add_try_columns_word'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Add calls_text counter to word table.

    NOT NULL with a server_default so existing rows are backfilled with 0 --
    a NULL here would break Word.parse_obj, whose calls_text field is a plain int.
    """
    op.add_column(
        'word',
        sa.Column('calls_text', sa.Integer(), nullable=False, server_default='0'),
    )


def downgrade() -> None:
    """Remove calls_text column from word table."""
    op.drop_column('word', 'calls_text')
