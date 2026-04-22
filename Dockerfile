FROM python:3.12-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      perl \
      procps \
      libparallel-forkmanager-perl \
      libio-compress-perl \
    && pip install --no-cache-dir pandas==2.2.2 matplotlib==3.9.0 seaborn==0.13.2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
