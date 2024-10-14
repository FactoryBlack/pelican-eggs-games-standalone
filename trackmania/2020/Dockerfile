# Base image - lightweight Alpine Linux
FROM alpine:3.18.4

# Install dependencies (git, curl, node, npm, etc.)
RUN apk update && apk upgrade && \
    apk add --no-cache \
    git \
    xmlstarlet \
    jq \
    curl \
    unzip \
    nodejs \
    npm \
    python3 \
    py3-pip \
    dos2unix \
    sudo

# Create necessary directories
RUN mkdir -p /mnt/server

# Set the working directory to /mnt/server
WORKDIR /mnt/server

# Copy the start script into /mnt/server
COPY start-minicontrol.sh /mnt/server/start-minicontrol.sh

# Ensure proper line endings for Linux (start-minicontrol.sh)
RUN dos2unix /mnt/server/start-minicontrol.sh

# Set executable permissions for the start script
RUN chmod +x /mnt/server/start-minicontrol.sh

# Copy the entrypoint script
COPY entrypoint.sh /mnt/server/entrypoint.sh

# Ensure proper line endings for entrypoint and start command
RUN dos2unix /mnt/server/entrypoint.sh && chmod +x /mnt/server/entrypoint.sh

# Set the entrypoint to handle initialization and setup
ENTRYPOINT ["/mnt/server/entrypoint.sh"]
