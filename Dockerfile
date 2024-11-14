FROM ubuntu:latest

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-dev \          
    python3-pip \
    python3-venv \           
    git \
    gcc \                    
    libyaml-dev              
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
