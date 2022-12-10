FROM python:3.11.0-slim

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
