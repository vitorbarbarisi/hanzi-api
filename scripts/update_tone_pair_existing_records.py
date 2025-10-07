#!/usr/bin/env python3
"""
Script to update tone_pair field for existing records in word table
This script can be run from the application context
"""

import asyncio
import sys
import os
from typing import Optional

# Add the project root to Python path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from hanziapp.core.word.entities.word import CreateWordDto
from hanziapp.infra.database.sqlalchemy import database
from hanziapp.infra.database.models.word import Word as WordModel


def extract_tone_pair_from_pinyin(pinyin: str) -> Optional[int]:
    """
    Extract tone pair from pinyin string.
    Example: "yī xià" -> 14
    Handles all 5 tones including neutral tone (5th tone)
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
    
    # Split pinyin by spaces and get first two syllables
    syllables = pinyin.strip().split()
    if len(syllables) < 2:
        return None
    
    first_syllable = syllables[0].lower()
    second_syllable = syllables[1].lower()
    
    def extract_tone(syllable: str) -> int:
        """
        Extract tone from a syllable.
        Returns 5 (neutral tone) if no tone mark is found.
        """
        # Check for tone marks in the syllable
        for char in syllable:
            if char in tone_map:
                return tone_map[char]
        
        # If no tone mark found, it's neutral tone (5th tone)
        return 5
    
    # Extract tones from both syllables
    first_tone = extract_tone(first_syllable)
    second_tone = extract_tone(second_syllable)
    
    # Return as two-digit number
    return int(f"{first_tone}{second_tone}")


async def update_tone_pairs():
    """Update tone_pair for all existing records"""
    
    print("Starting tone_pair update process...")
    print("=" * 50)
    
    # Connect to database
    await database.connect()
    
    try:
        # Get all records that need updating
        query = WordModel.select().where(
            (WordModel.c.pinyin.isnot(None)) & 
            (WordModel.c.tone_pair.is_(None))
        )
        
        records = await database.fetch_all(query)
        
        print(f"Found {len(records)} records to update")
        
        if len(records) == 0:
            print("No records need updating!")
            return
        
        # Show some examples before updating
        print("\nSample records to be updated:")
        for i, record in enumerate(records[:5]):
            tone_pair = extract_tone_pair_from_pinyin(record.pinyin)
            print(f"  {record.word}: '{record.pinyin}' -> {tone_pair}")
        
        if len(records) > 5:
            print(f"  ... and {len(records) - 5} more records")
        
        # Update records in batches
        batch_size = 100
        updated_count = 0
        
        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]
            
            for record in batch:
                tone_pair = extract_tone_pair_from_pinyin(record.pinyin)
                
                if tone_pair is not None:
                    # Update the record
                    update_query = (
                        WordModel.update()
                        .where(WordModel.c.word == record.word)
                        .values(tone_pair=tone_pair)
                    )
                    await database.execute(update_query)
                    updated_count += 1
                else:
                    print(f"  Warning: Could not extract tone from '{record.pinyin}' for word '{record.word}'")
            
            print(f"  Processed batch {i//batch_size + 1}/{(len(records) + batch_size - 1)//batch_size}")
        
        print(f"\nUpdate completed!")
        print(f"Successfully updated {updated_count} records")
        
        # Show final statistics
        total_query = WordModel.select()
        total_records = await database.fetch_all(total_query)
        
        with_tone_pair = sum(1 for r in total_records if r.tone_pair is not None)
        without_tone_pair = sum(1 for r in total_records if r.tone_pair is None)
        
        print(f"\nFinal statistics:")
        print(f"  Total records: {len(total_records)}")
        print(f"  With tone_pair: {with_tone_pair}")
        print(f"  Without tone_pair: {without_tone_pair}")
        
        # Show some examples of updated records
        print(f"\nSample updated records:")
        updated_query = WordModel.select().where(WordModel.c.tone_pair.isnot(None)).limit(5)
        updated_records = await database.fetch_all(updated_query)
        
        for record in updated_records:
            print(f"  {record.word}: '{record.pinyin}' -> {record.tone_pair}")
        
    finally:
        await database.disconnect()


async def main():
    """Main function"""
    try:
        await update_tone_pairs()
    except Exception as e:
        print(f"Error during update: {e}")
        sys.exit(1)


if __name__ == "__main__":
    asyncio.run(main())
