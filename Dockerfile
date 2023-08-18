FROM --platform=linux/x86_64 python:3.8.16-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=./

ENV POETRY_REQUESTS_TIMEOUT=600

COPY .kaggle/ ~/.kaggle/
COPY settings/ ../usr/local/share/jupyter/lab/settings/

RUN apt-get update && apt-get install -y libgomp1

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install poetry==1.5.1

COPY pyproject.toml ./
COPY poetry.lock ./

RUN poetry config virtualenvs.create false \
  && poetry install
