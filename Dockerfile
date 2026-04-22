FROM python:3.12-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends perl cpanminus gzip procps \
    && cpanm --notest Parallel::ForkManager IO::Uncompress::Gunzip \
    && pip install --no-cache-dir pandas matplotlib seaborn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
