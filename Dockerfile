FROM ubuntu:latest

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
 && apt-get upgrade -y

# Install PyYAML Python package
RUN pip3 install PyYAML

# Copy the Python script and entrypoint script
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
