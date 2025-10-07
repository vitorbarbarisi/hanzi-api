"""add tone_pair to word table

Revision ID: add_tone_pair_to_word_table
Revises: create_word_table
Create Date: 2024-01-22 12:00:00.000000

"""
import sqlalchemy as sa

from typing import Sequence, Union
from alembic import op

# revision identifiers, used by Alembic.
revision: str = 'add_tone_pair_to_word_table'
down_revision: Union[str, None] = 'create_word_table'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade():
    # Add tone_pair column to word table
    op.add_column('word', sa.Column('tone_pair', sa.Integer, nullable=True))


def downgrade():
    # Remove tone_pair column from word table
    op.drop_column('word', 'tone_pair')
