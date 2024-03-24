import json
from typing import Optional

from pydantic import BaseModel, Field


class CreateHanziDto(BaseModel):
    character: str
    frequency: int
    calls: int = Field(default=0, init=False)
    meaning: str = Field(default="", init=False)
    decomposition: str = Field(default="", init=False)
    etymology: str = Field(default="", init=False)
    related_words: str = Field(default="", init=False)

    class Config:
        allow_mutation = False


class Hanzi(BaseModel):
    character: str
    frequency: int
    calls: int = Field(default=0)
    meaning: str = Field(default="")
    decomposition: str = Field(default="")
    etymology: str = Field(default="")
    related_words: str = Field(default="")

    class Config:
        allow_mutation = False
        orm_mode = True

    def to_json(self):
        return json.dumps(self.__dict__)
    
    @staticmethod
    def from_json(json_str):
        return Hanzi.parse_obj(json.loads(json_str))


class UpdateHanziDto(BaseModel):
    calls: int
    meaning: str
    decomposition: str
    etymology: str
    related_words: str

    class Config:
        allow_mutation = False
