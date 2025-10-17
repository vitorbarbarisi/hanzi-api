"""add decomposition_meaning field

Revision ID: add_decomposition_meaning
Revises: 999999999999
Create Date: 2025-10-17 12:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'add_decomposition_meaning'
down_revision: Union[str, None] = '999999999999'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Add decomposition_meaning column to hanzi table"""
    op.add_column('hanzi', sa.Column('decomposition_meaning', sa.String(), server_default=''))


def downgrade() -> None:
    """Remove decomposition_meaning column from hanzi table"""
    op.drop_column('hanzi', 'decomposition_meaning')
