"""rename etymology to appears_in

Revision ID: a1b2c3d4e5f6
Revises: fd4ea7c08a33
Create Date: 2025-10-15 00:00:00.000000

"""
import sqlalchemy as sa

from typing import Sequence, Union
from alembic import op

# revision identifiers, used by Alembic.
revision: str = 'a1b2c3d4e5f6'
down_revision: Union[str, None] = 'fd4ea7c08a33'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade():
    """Rename etymology column to appears_in"""
    op.alter_column('hanzi', 'etymology', new_column_name='appears_in')


def downgrade():
    """Rename appears_in column back to etymology"""
    op.alter_column('hanzi', 'appears_in', new_column_name='etymology')
