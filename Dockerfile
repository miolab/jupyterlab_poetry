FROM --platform=linux/x86_64 python:3.12.10-slim

ENV PYTHONUNBUFFERED=1 \
  PYTHONPATH=./ \
  PIP_DEFAULT_TIMEOUT=4800 \
  PIP_RETRIES=3 \
  PIP_NO_CACHE_DIR=false \
  POETRY_REQUESTS_TIMEOUT=4800 \
  POETRY_HTTP_RETRIES=5 \
  POETRY_HTTP_TIMEOUT=4800 \
  POETRY_INSTALLER_MAX_WORKERS=4 \
  PATH="/usr/bin:$PATH" \
  LLVM_CONFIG="/usr/bin/llvm-config"

COPY settings/ ../usr/local/share/jupyter/lab/settings/
COPY .kaggle/ ~/.kaggle/

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  libgomp1 llvm-14 build-essential && \
  apt-get clean && \
  rm -rf  /var/lib/apt/lists/*

WORKDIR /app

# Install pip and poetry
RUN pip install --upgrade pip poetry==2.1.2

COPY pyproject.toml ./
COPY poetry.lock ./

RUN poetry config virtualenvs.create false && \
  poetry install --no-interaction --no-root
