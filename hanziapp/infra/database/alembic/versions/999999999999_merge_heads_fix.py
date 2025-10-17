"""merge heads: etymology rename and word translation

Revision ID: merge_heads_fix
Revises: d315a7406375, rename_etymology_to_appears_in
Create Date: 2025-10-17 00:00:00.000000

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# multiple heads merge
revision: str = '999999999999'
down_revision: Union[str, Sequence[str], None] = ('d315a7406375', 'a1b2c3d4e5f6')
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    """Merge the two head revisions - no schema changes needed"""
    pass


def downgrade() -> None:
    """Downgrade merge - no schema changes needed"""
    pass
