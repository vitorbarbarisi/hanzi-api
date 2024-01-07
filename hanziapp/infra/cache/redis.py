import redis

from hanziapp.config.environment import get_settings


_SETTINGS = get_settings()

redis_host = str(_SETTINGS.REDIS_HOST)
redis_port = str(_SETTINGS.REDIS_PORT)


class Cache():
    def __init__(self):
        self.redis_connection = redis.Redis(host=redis_host, port=redis_port)

    def get(self, key):
        return self.redis_connection.get(key)

    def set(self, key, value):
        self.redis_connection.set(key, value)

cache = Cache()
