#!/usr/bin/env python3
"""
Script to update tone_pair field for existing records in word table
This script can be run from the application context
"""

import asyncio
import sys
import os
from typing import Optional, List
from sqlalchemy import select, update as sqlalchemy_update, func, text

# Add the project root to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from hanziapp.infra.database.sqlalchemy import get_async_session
from hanziapp.infra.database.models.word import Word as WordModel


def extract_tone_pair_from_pinyin(pinyin: str) -> Optional[int]:
    """
    Extract tone sequence from pinyin string.
    Examples:
      - "jù" -> 4
      - "yuē" -> 1
      - "kàn qǐ lái" -> 432
      - "rén gōng zhì néng" -> 2142
      - "sāi bā sī dì ān" -> 11141

    Handles all 5 tones including neutral tone (5th tone).
    Returns an integer formed by concatenating per-syllable tones.
    """
    if not pinyin:
        return None
    
    # Tone mapping for pinyin characters with tone marks
    tone_map = {
        'ā': 1, 'á': 2, 'ǎ': 3, 'à': 4,
        'ē': 1, 'é': 2, 'ě': 3, 'è': 4,
        'ī': 1, 'í': 2, 'ǐ': 3, 'ì': 4,
        'ō': 1, 'ó': 2, 'ǒ': 3, 'ò': 4,
        'ū': 1, 'ú': 2, 'ǔ': 3, 'ù': 4,
        'ǖ': 1, 'ǘ': 2, 'ǚ': 3, 'ǜ': 4,
    }
    
    # Split pinyin by spaces and process all syllables
    syllables = pinyin.strip().split()
    if len(syllables) == 0:
        return None
    
    def extract_tone(syllable: str) -> int:
        """Extract tone from a syllable. Defaults to 5 (neutral) if none found."""
        s = syllable.lower()
        for char in s:
            if char in tone_map:
                return tone_map[char]
        return 5
    
    tones = [str(extract_tone(syllable)) for syllable in syllables]
    digits = "".join(tones)
    return int(digits) if digits else None


async def update_tone_pairs():
    """Update tone_pair for all existing records"""
    print("Starting tone_pair update process...")
    print("=" * 50)

    async with get_async_session() as session:
        # Ensure DB column can hold long sequences (upgrade to BIGINT if needed)
        # Check current data type and upgrade to BIGINT if needed
        try:
            res = await session.execute(
                text(
                    "SELECT data_type FROM information_schema.columns "
                    "WHERE table_name = 'word' AND column_name = 'tone_pair'"
                )
            )
            current_type = res.scalar()
            if current_type and current_type.lower() in {"integer", "int", "int4"}:
                await session.execute(
                    text("ALTER TABLE word ALTER COLUMN tone_pair TYPE BIGINT USING tone_pair::BIGINT")
                )
                await session.commit()
                print("Upgraded column 'tone_pair' to BIGINT")
        except Exception as e:
            # Ignore if already BIGINT; rollback any failed DDL
            await session.rollback()
            print(f"Warning: could not upgrade tone_pair column type automatically: {e}")
        # Fetch all words that have non-empty pinyin; we'll fix both missing and wrong-length tone_pairs
        query = (
            select(WordModel)
            .where(WordModel.c.pinyin.isnot(None))
            .where(func.trim(WordModel.c.pinyin) != "")
        )
        result = await session.execute(query)
        rows = result.fetchall()
        records: List[dict] = [dict(row._mapping) for row in rows]

        print(f"Found {len(records)} records with non-empty pinyin to check")

        if len(records) == 0:
            print("No records need updating!")
            return

        # Show some examples before updating
        print("\nSample records (expected recalculation shown):")
        for record in records[:5]:
            new_tone_pair = extract_tone_pair_from_pinyin(record["pinyin"])
            print(f"  {record['word']}: '{record['pinyin']}' -> {new_tone_pair}")

        # Update records in batches
        batch_size = 200
        updated_missing = 0
        updated_mismatch = 0
        skipped = 0

        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]

            for record in batch:
                pinyin = record["pinyin"]
                current = record.get("tone_pair")
                syllables_count = len(pinyin.strip().split())
                new_tone_pair = extract_tone_pair_from_pinyin(pinyin)

                if new_tone_pair is None:
                    skipped += 1
                    continue

                current_len = len(str(current)) if current is not None else 0

                # Update if missing or if digits length doesn't match syllable count, or value differs
                if current is None:
                    update_query = (
                        sqlalchemy_update(WordModel)
                        .where(WordModel.c.word == record["word"])
                        .values(tone_pair=new_tone_pair)
                    )
                    await session.execute(update_query)
                    updated_missing += 1
                elif current != new_tone_pair or current_len != syllables_count:
                    update_query = (
                        sqlalchemy_update(WordModel)
                        .where(WordModel.c.word == record["word"])
                        .values(tone_pair=new_tone_pair)
                    )
                    await session.execute(update_query)
                    updated_mismatch += 1
                else:
                    skipped += 1

            print(
                f"  Processed batch {i//batch_size + 1}/{(len(records) + batch_size - 1)//batch_size}"
            )

        print("\nUpdate completed!")
        print(f"Updated missing tone_pair: {updated_missing}")
        print(f"Updated mismatched tone_pair: {updated_mismatch}")
        print(f"Skipped (already correct or unprocessable): {skipped}")

        # Final statistics
        total_query = select(WordModel)
        total_result = await session.execute(total_query)
        total_rows = total_result.fetchall()
        total_records: List[dict] = [dict(row._mapping) for row in total_rows]

        with_tone_pair = sum(1 for r in total_records if r.get("tone_pair") is not None)
        without_tone_pair = sum(1 for r in total_records if r.get("tone_pair") is None)

        print(f"\nFinal statistics:")
        print(f"  Total records: {len(total_records)}")
        print(f"  With tone_pair: {with_tone_pair}")
        print(f"  Without tone_pair: {without_tone_pair}")

        # Show examples of corrected long words (>2 syllables) if any
        print("\nSample words with >2 syllables after correction:")
        sample_long_query = (
            select(WordModel)
            .where(WordModel.c.pinyin.isnot(None))
            .where(func.length(func.replace(func.trim(WordModel.c.pinyin), ' ', '')) < func.length(func.trim(WordModel.c.pinyin)))
            .limit(5)
        )
        sample_long_result = await session.execute(sample_long_query)
        sample_long_rows = sample_long_result.fetchall()
        for row in sample_long_rows:
            r = dict(row._mapping)
            print(f"  {r['word']}: '{r['pinyin']}' -> {r['tone_pair']}")


async def main():
    """Main function"""
    try:
        await update_tone_pairs()
    except Exception as e:
        print(f"Error during update: {e}")
        sys.exit(1)


if __name__ == "__main__":
    asyncio.run(main())
