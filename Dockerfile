FROM --platform=linux/x86_64 python:3.11.6-slim

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
RUN poetry add numpy@1.25.2
RUN poetry source add --priority=explicit pytorch-cpu-src https://download.pytorch.org/whl/cpu
RUN poetry add --source pytorch-cpu-src torch@2.3.1+cpu torchvision@0.18.1+cpu torchaudio@2.3.1+cpu
RUN poetry install --no-interaction
