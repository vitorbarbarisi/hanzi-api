from celery import Celery

celery_app = Celery("myapp", broker="pyamqp://guest@localhost//")

# Optional configuration, see the application user guide.
celery_app.conf.update(result_expires=3600,)