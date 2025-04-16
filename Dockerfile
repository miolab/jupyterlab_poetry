FROM --platform=linux/x86_64 python:3.12.10-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=./

ENV PIP_DEFAULT_TIMEOUT=3600
ENV POETRY_REQUESTS_TIMEOUT=3600

COPY settings/ ../usr/local/share/jupyter/lab/settings/
COPY .kaggle/ ~/.kaggle/

RUN apt-get update && apt-get install -y libgomp1 llvm-14 build-essential

ENV PATH="/usr/bin:$PATH"
ENV LLVM_CONFIG="/usr/bin/llvm-config"

WORKDIR /app

RUN pip install --upgrade pip
RUN pip install poetry==1.8.3

COPY pyproject.toml ./
COPY poetry.lock ./

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction
