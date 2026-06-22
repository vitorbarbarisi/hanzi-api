"""add try and try_translation to word table

Revision ID: add_try_columns_word
Revises: add_decomposition_meaning
Create Date: 2025-02-18 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'add_try_columns_word'
down_revision: Union[str, None] = 'add_decomposition_meaning'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Add try and try_translation columns to word table (nullable, DB-only)."""
    op.add_column('word', sa.Column('try', sa.String(), nullable=True))
    op.add_column('word', sa.Column('try_translation', sa.String(), nullable=True))


def downgrade() -> None:
    """Remove try and try_translation columns from word table."""
    op.drop_column('word', 'try_translation')
    op.drop_column('word', 'try')
