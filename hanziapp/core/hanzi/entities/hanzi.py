import json
from typing import Optional

from pydantic import BaseModel, Field


class CreateHanziDto(BaseModel):
    character: str
    frequency: int
    calls: int = Field(default=0, init=False)

    class Config:
        allow_mutation = False


class Hanzi(BaseModel):
    character: str
    frequency: int
    calls: int = Field(default=0)

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

    class Config:
        allow_mutation = False
