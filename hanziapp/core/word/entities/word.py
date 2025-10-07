import json
import re
from typing import Optional

from pydantic import BaseModel, Field, validator


class CreateWordDto(BaseModel):
    word: str
    pinyin: str
    translation: str
    calls: int = Field(default=0, init=False)
    confidence_level: int
    tone_pair: Optional[int] = Field(default=None, init=False)

    @validator('confidence_level')
    def validate_confidence_level(cls, v):
        if v < 1 or v > 3:
            raise ValueError('confidence_level must be between 1 and 3')
        return v

    @validator('tone_pair', pre=True, always=True)
    def extract_tone_pair(cls, v, values):
        if 'pinyin' in values:
            return cls._extract_tone_pair_from_pinyin(values['pinyin'])
        return v

    @staticmethod
    def _extract_tone_pair_from_pinyin(pinyin: str) -> Optional[int]:
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

    class Config:
        allow_mutation = False


class Word(BaseModel):
    word: str
    pinyin: str
    translation: str
    calls: int = Field(default=0)
    confidence_level: int
    tone_pair: Optional[int] = None

    @validator('confidence_level')
    def validate_confidence_level(cls, v):
        if v < 1 or v > 3:
            raise ValueError('confidence_level must be between 1 and 3')
        return v

    class Config:
        allow_mutation = False
        orm_mode = True

    def to_json(self):
        return json.dumps(self.__dict__)
    
    @staticmethod
    def from_json(json_str):
        return Word.parse_obj(json.loads(json_str))


class UpdateWordDto(BaseModel):
    pinyin: Optional[str] = None
    translation: Optional[str] = None
    calls: Optional[int] = None
    confidence_level: Optional[int] = None
    tone_pair: Optional[int] = None

    @validator('confidence_level')
    def validate_confidence_level(cls, v):
        if v is not None and (v < 1 or v > 3):
            raise ValueError('confidence_level must be between 1 and 3')
        return v

    @validator('tone_pair', pre=True, always=True)
    def extract_tone_pair(cls, v, values):
        if 'pinyin' in values and values['pinyin'] is not None:
            return CreateWordDto._extract_tone_pair_from_pinyin(values['pinyin'])
        return v

    class Config:
        allow_mutation = False
