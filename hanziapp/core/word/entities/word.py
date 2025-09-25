import json
from typing import Optional

from pydantic import BaseModel, Field, validator


class CreateWordDto(BaseModel):
    word: str
    pinyin: str
    translation: str
    calls: int = Field(default=0, init=False)
    confidence_level: int

    @validator('confidence_level')
    def validate_confidence_level(cls, v):
        if v < 1 or v > 3:
            raise ValueError('confidence_level must be between 1 and 3')
        return v

    class Config:
        allow_mutation = False


class Word(BaseModel):
    word: str
    pinyin: str
    translation: str
    calls: int = Field(default=0)
    confidence_level: int

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

    @validator('confidence_level')
    def validate_confidence_level(cls, v):
        if v is not None and (v < 1 or v > 3):
            raise ValueError('confidence_level must be between 1 and 3')
        return v

    class Config:
        allow_mutation = False
