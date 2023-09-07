FROM --platform=linux/x86_64 python:3.8.18-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=./

ENV PIP_DEFAULT_TIMEOUT=3600
ENV POETRY_REQUESTS_TIMEOUT=3600

COPY settings/ ../usr/local/share/jupyter/lab/settings/
COPY .kaggle/ ~/.kaggle/

RUN apt-get update && apt-get install -y libgomp1

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install poetry==1.5.1

COPY pyproject.toml ./
COPY poetry.lock ./

RUN poetry config virtualenvs.create false
RUN poetry add numpy@1.23.5
RUN poetry source add --priority=explicit pytorch-cpu-src https://download.pytorch.org/whl/cpu
RUN poetry add --source pytorch-cpu-src torch@2.0.1 torchvision torchaudio
RUN poetry install --no-interaction
