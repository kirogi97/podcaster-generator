# Use an Ubuntu base image that is known to work well with Python
FROM ubuntu:22.04  # Use a specific version of Ubuntu (e.g., 22.04)

# Install necessary dependencies for Python and PyYAML
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.10 \
    python3.10-dev \
    python3-pip \
    git \
    gcc \
    libyaml-dev \
    build-essential \
    && apt-get clean

# Upgrade pip to the latest version
RUN python3.10 -m pip install --upgrade pip

# Install PyYAML using the upgraded pip
RUN python3.10 -m pip install PyYAML

# Copy your application files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
