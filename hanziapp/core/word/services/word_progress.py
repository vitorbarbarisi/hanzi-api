"""How many correct answers a word needs to earn each confidence level."""
from typing import Optional, Tuple

CONFIDENCE_2_AT = 10
CONFIDENCE_3_AT = 20

# (correct answers, level), highest first: the first one reached wins.
CONFIDENCE_MILESTONES: Tuple[Tuple[int, int], ...] = (
    (CONFIDENCE_3_AT, 3),
    (CONFIDENCE_2_AT, 2),
)


def target_confidence(count: int) -> Optional[int]:
    """The confidence level a count has earned; None before the first milestone."""
    return next((level for at, level in CONFIDENCE_MILESTONES if count >= at), None)
