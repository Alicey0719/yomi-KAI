FROM python:3.9.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg portaudio19-dev \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --upgrade pip
ADD requirement.txt /tmp/requirement.txt
RUN python -m pip install -r /tmp/requirement.txt
