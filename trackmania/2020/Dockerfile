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
    dos2unix

# Create necessary directories
RUN mkdir -p /mnt/server

# Set the working directory to /mnt/server
WORKDIR /mnt/server

# Copy the entrypoint script into /mnt/server
COPY entrypoint.sh /mnt/server/entrypoint.sh

# Ensure proper line endings for Linux
RUN dos2unix /mnt/server/entrypoint.sh

# Set executable permissions for the entrypoint script
RUN chmod +x /mnt/server/entrypoint.sh

# Set the entrypoint to the correct path
ENTRYPOINT ["/mnt/server/entrypoint.sh"]
