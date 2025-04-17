FROM --platform=linux/x86_64 python:3.12.10-slim

ENV PYTHONUNBUFFERED=1 \
  PYTHONPATH=./ \
  PIP_DEFAULT_TIMEOUT=3600 \
  POETRY_REQUESTS_TIMEOUT=3600 \
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
