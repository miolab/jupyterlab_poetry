FROM python:3.11.0-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=./

WORKDIR /app

WORKDIR /app
COPY pyproject.toml ./
COPY poetry.lock ./

RUN pip install --upgrade pip
RUN pip install poetry

RUN poetry config virtualenvs.create false \
  && poetry install
