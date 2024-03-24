"""create hanzi table

Revision ID: fd4ea7c08a33
Revises: 
Create Date: 2024-01-22 00:46:39.386686

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = 'fd4ea7c08a33'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade():
    op.create_table(
        "hanzi",
        sa.Column("character", sa.String(length=1), primary_key=True),
        sa.Column("frequency", sa.Integer, nullable=False),
        sa.Column("calls", sa.Integer, default=0),
        sa.Column("meaning", sa.String, default=""),
        sa.Column("decomposition", sa.String, default=""),
        sa.Column("etymology", sa.String, default=""),
        sa.Column("related_words", sa.String, default=""),
        sa.CheckConstraint(
            "length(character) = 1",
            name=op.f("character_length"),
        ),
        sa.PrimaryKeyConstraint("character", name=op.f("pk_hanzi")),
        if_not_exists=True
    )


def downgrade():
    op.drop_table("hanzi")
