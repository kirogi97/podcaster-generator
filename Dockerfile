FROM ubuntu:22.04  # Use a stable version of Ubuntu that supports Python 3.10

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
    python3.10 \
    python3.10-dev \        # Development headers for Python 3.10
    python3.10-venv \       # Python 3.10 virtual environment support
    python3-pip \
    git \
    gcc \                   # Required for compiling C extensions like PyYAML
    libyaml-dev \           # Required for PyYAML
    build-essential         # Required for building Python packages (like PyYAML)

# Ensure pip is up-to-date
RUN python3.10 -m pip install --upgrade pip

# Install PyYAML Python package
RUN python3.10 -m pip install PyYAML

# Copy the Python script and entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
