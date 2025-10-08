from pydantic import BaseModel, Field


class CreateWordTranslationRequestDto(BaseModel):
    translation: str

    class Config:
        allow_mutation = False


class CreateWordTranslationDto(BaseModel):
    word: str
    translation: str

    class Config:
        allow_mutation = False


class WordTranslation(BaseModel):
    id: int
    word: str
    translation: str

    class Config:
        allow_mutation = False
        orm_mode = True

    def to_json(self):
        import json
        return json.dumps(self.__dict__)
    
    @staticmethod
    def from_json(json_str):
        import json
        return WordTranslation.parse_obj(json.loads(json_str))

