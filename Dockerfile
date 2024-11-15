# Use a stable Ubuntu version (e.g., 22.04)
FROM ubuntu:22.04

# Set the environment variable to non-interactive to avoid tzdata prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and the deadsnakes PPA repository to get Python 3.11
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3-pip \
    git \
    gcc \
    libyaml-dev \
    build-essential \
    tzdata \
    && apt-get clean

# Upgrade pip to the latest version
RUN python3.11 -m pip install --upgrade pip

# Install PyYAML using the upgraded pip
RUN python3.11 -m pip install PyYAML

# Copy your application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
