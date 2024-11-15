FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.13 \
    python3-pip \
    git \
    gcc \
    python3-dev \
    libyaml-dev \
    build-essential

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
