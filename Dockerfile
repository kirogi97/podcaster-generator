FROM ubuntu:latest

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-dev \          # Needed for building certain Python packages
    python3-pip \
    python3-venv \            # To use virtual environments (optional)
    git \
    gcc \                     # Required for compiling PyYAML and other packages
    libyaml-dev               # Required for PyYAML to compile correctly

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
