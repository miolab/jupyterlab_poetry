FROM --platform=linux/x86_64 python:3.8.16-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=./

COPY settings/ ../usr/local/share/jupyter/lab/settings/

WORKDIR /app
COPY pyproject.toml ./
COPY poetry.lock ./

RUN pip install --upgrade pip
RUN pip install poetry

RUN poetry config virtualenvs.create false \
  && poetry install
