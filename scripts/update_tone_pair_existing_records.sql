-- Script to update tone_pair field for existing records in word table
-- This script extracts tone information from pinyin field and populates tone_pair

-- First, let's create a function to extract tone pair from pinyin
CREATE OR REPLACE FUNCTION extract_tone_pair(pinyin_text TEXT)
RETURNS INTEGER AS $$
DECLARE
    syllables TEXT[];
    first_syllable TEXT;
    second_syllable TEXT;
    first_tone INTEGER;
    second_tone INTEGER;
    char TEXT;
    i INTEGER;
BEGIN
    -- Return NULL if pinyin is empty or null
    IF pinyin_text IS NULL OR TRIM(pinyin_text) = '' THEN
        RETURN NULL;
    END IF;
    
    -- Split pinyin by spaces
    syllables := string_to_array(TRIM(pinyin_text), ' ');
    
    -- Check if we have at least 2 syllables
    IF array_length(syllables, 1) < 2 THEN
        RETURN NULL;
    END IF;
    
    first_syllable := LOWER(syllables[1]);
    second_syllable := LOWER(syllables[2]);
    
    -- Function to extract tone from a syllable
    -- Returns 5 (neutral tone) if no tone mark is found
    first_tone := 5; -- Default to neutral tone
    second_tone := 5; -- Default to neutral tone
    
    -- Check first syllable for tone marks
    FOR i IN 1..length(first_syllable) LOOP
        char := substring(first_syllable, i, 1);
        CASE char
            WHEN 'ā' THEN first_tone := 1;
            WHEN 'á' THEN first_tone := 2;
            WHEN 'ǎ' THEN first_tone := 3;
            WHEN 'à' THEN first_tone := 4;
            WHEN 'ē' THEN first_tone := 1;
            WHEN 'é' THEN first_tone := 2;
            WHEN 'ě' THEN first_tone := 3;
            WHEN 'è' THEN first_tone := 4;
            WHEN 'ī' THEN first_tone := 1;
            WHEN 'í' THEN first_tone := 2;
            WHEN 'ǐ' THEN first_tone := 3;
            WHEN 'ì' THEN first_tone := 4;
            WHEN 'ō' THEN first_tone := 1;
            WHEN 'ó' THEN first_tone := 2;
            WHEN 'ǒ' THEN first_tone := 3;
            WHEN 'ò' THEN first_tone := 4;
            WHEN 'ū' THEN first_tone := 1;
            WHEN 'ú' THEN first_tone := 2;
            WHEN 'ǔ' THEN first_tone := 3;
            WHEN 'ù' THEN first_tone := 4;
            WHEN 'ǖ' THEN first_tone := 1;
            WHEN 'ǘ' THEN first_tone := 2;
            WHEN 'ǚ' THEN first_tone := 3;
            WHEN 'ǜ' THEN first_tone := 4;
        END CASE;
    END LOOP;
    
    -- Check second syllable for tone marks
    FOR i IN 1..length(second_syllable) LOOP
        char := substring(second_syllable, i, 1);
        CASE char
            WHEN 'ā' THEN second_tone := 1;
            WHEN 'á' THEN second_tone := 2;
            WHEN 'ǎ' THEN second_tone := 3;
            WHEN 'à' THEN second_tone := 4;
            WHEN 'ē' THEN second_tone := 1;
            WHEN 'é' THEN second_tone := 2;
            WHEN 'ě' THEN second_tone := 3;
            WHEN 'è' THEN second_tone := 4;
            WHEN 'ī' THEN second_tone := 1;
            WHEN 'í' THEN second_tone := 2;
            WHEN 'ǐ' THEN second_tone := 3;
            WHEN 'ì' THEN second_tone := 4;
            WHEN 'ō' THEN second_tone := 1;
            WHEN 'ó' THEN second_tone := 2;
            WHEN 'ǒ' THEN second_tone := 3;
            WHEN 'ò' THEN second_tone := 4;
            WHEN 'ū' THEN second_tone := 1;
            WHEN 'ú' THEN second_tone := 2;
            WHEN 'ǔ' THEN second_tone := 3;
            WHEN 'ù' THEN second_tone := 4;
            WHEN 'ǖ' THEN second_tone := 1;
            WHEN 'ǘ' THEN second_tone := 2;
            WHEN 'ǚ' THEN second_tone := 3;
            WHEN 'ǜ' THEN second_tone := 4;
        END CASE;
    END LOOP;
    
    -- Return as two-digit number
    RETURN first_tone * 10 + second_tone;
END;
$$ LANGUAGE plpgsql;

-- Show current state before update
SELECT 'Before update - Records with NULL tone_pair:' as status, COUNT(*) as count 
FROM word 
WHERE tone_pair IS NULL;

-- Show some examples of what will be updated
SELECT 'Sample records to be updated:' as status;
SELECT word, pinyin, extract_tone_pair(pinyin) as calculated_tone_pair, tone_pair as current_tone_pair
FROM word 
WHERE pinyin IS NOT NULL 
LIMIT 10;

-- Update all records with calculated tone_pair
UPDATE word 
SET tone_pair = extract_tone_pair(pinyin)
WHERE pinyin IS NOT NULL 
  AND TRIM(pinyin) != '';

-- Show results after update
SELECT 'After update - Records with tone_pair populated:' as status, COUNT(*) as count 
FROM word 
WHERE tone_pair IS NOT NULL;

-- Show some examples of updated records
SELECT 'Sample updated records:' as status;
SELECT word, pinyin, tone_pair
FROM word 
WHERE tone_pair IS NOT NULL 
LIMIT 10;

-- Show any records that couldn't be processed
SELECT 'Records that could not be processed (no tone_pair):' as status, COUNT(*) as count
FROM word 
WHERE tone_pair IS NULL 
  AND pinyin IS NOT NULL 
  AND TRIM(pinyin) != '';

-- Clean up: Drop the temporary function
DROP FUNCTION IF EXISTS extract_tone_pair(TEXT);

-- Final summary
SELECT 'Update completed!' as status;
