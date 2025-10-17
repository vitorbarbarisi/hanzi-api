FROM python:3.11.9-alpine3.19 as development

# Set environment variables
ENV PYTHON_VERSION=3.11 \
  APP_PATH=/home/python/app \
  POETRY_VIRTUALENVS_CREATE=false \
  PATH=/home/python/.local/lib/python3.11/site-packages:/usr/local/bin:/home/python:/home/python/app/bin:$PATH

# Update package index and install dependencies
RUN apk update && \
    apk add --no-cache \
        build-base \
        openssl-dev \
        libffi-dev \
        postgresql-dev \
        curl \
        gcc \
        musl-dev && \
    pip install --upgrade pip && \
    pip install --no-cache-dir poetry==1.8.3

# Configure user, groups and working directory for application
RUN adduser -u 1000 -D python && \
  mkdir -p /home/python/app

# Set workdir
WORKDIR /home/python/app

# Copy project file and pre-install
COPY README.md .
COPY pyproject.toml .
RUN poetry lock && poetry install

# Copy application code
COPY hanziapp/ ./hanziapp/
COPY scripts/ ./scripts/

# Expose ports
EXPOSE 5000

# Set the Python path to include the current directory
ENV PYTHONPATH=/home/python/app

# Run the web server
CMD ["python", "-c", "from hanziapp import start_web_server; start_web_server()"]
