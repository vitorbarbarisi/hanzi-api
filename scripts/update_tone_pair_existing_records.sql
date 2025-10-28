-- Script to update tone_pair field for existing records in word table
-- This script extracts tone information from pinyin field and populates tone_pair

-- First, let's create a function to extract tone pair from pinyin
CREATE OR REPLACE FUNCTION extract_tone_pair(pinyin_text TEXT)
RETURNS INTEGER AS $$
DECLARE
    syllables TEXT[];
    syllable TEXT;
    tone_digits TEXT := '';
    tone INTEGER;
    char TEXT;
    i INTEGER;
    idx INTEGER;
BEGIN
    -- Return NULL if pinyin is empty or null
    IF pinyin_text IS NULL OR TRIM(pinyin_text) = '' THEN
        RETURN NULL;
    END IF;
    
    -- Split pinyin by spaces
    syllables := string_to_array(TRIM(pinyin_text), ' ');
    
    -- Process all syllables; for each, extract tone digit and append
    FOR idx IN 1..array_length(syllables, 1) LOOP
        syllable := LOWER(syllables[idx]);
        tone := 5; -- default neutral tone
        
        FOR i IN 1..length(syllable) LOOP
            char := substring(syllable, i, 1);
            CASE char
                WHEN 'ā' THEN tone := 1;
                WHEN 'á' THEN tone := 2;
                WHEN 'ǎ' THEN tone := 3;
                WHEN 'à' THEN tone := 4;
                WHEN 'ē' THEN tone := 1;
                WHEN 'é' THEN tone := 2;
                WHEN 'ě' THEN tone := 3;
                WHEN 'è' THEN tone := 4;
                WHEN 'ī' THEN tone := 1;
                WHEN 'í' THEN tone := 2;
                WHEN 'ǐ' THEN tone := 3;
                WHEN 'ì' THEN tone := 4;
                WHEN 'ō' THEN tone := 1;
                WHEN 'ó' THEN tone := 2;
                WHEN 'ǒ' THEN tone := 3;
                WHEN 'ò' THEN tone := 4;
                WHEN 'ū' THEN tone := 1;
                WHEN 'ú' THEN tone := 2;
                WHEN 'ǔ' THEN tone := 3;
                WHEN 'ù' THEN tone := 4;
                WHEN 'ǖ' THEN tone := 1;
                WHEN 'ǘ' THEN tone := 2;
                WHEN 'ǚ' THEN tone := 3;
                WHEN 'ǜ' THEN tone := 4;
            END CASE;
        END LOOP;
        tone_digits := tone_digits || CAST(tone AS TEXT);
    END LOOP;
    
    -- Return concatenated digits as integer
    RETURN CAST(tone_digits AS INTEGER);
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
