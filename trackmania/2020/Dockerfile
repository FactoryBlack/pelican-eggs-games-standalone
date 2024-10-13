# Base image - lightweight Alpine Linux
FROM alpine:3.12

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
    py3-pip

# Create necessary directories (like /mnt/server and /mnt/install)
RUN mkdir -p /mnt/server /mnt/install

# Set the working directory to /mnt/server
WORKDIR /mnt/server

# Copy the entrypoint and install scripts into the container
COPY entrypoint.sh /entrypoint.sh
COPY start.sh /mnt/server/start.sh
COPY install.sh /mnt/install/install.sh

# Set executable permissions for the scripts
RUN chmod +x /entrypoint.sh /mnt/server/start.sh /mnt/install/install.sh

# Set the entrypoint to handle initialization when the container starts
ENTRYPOINT ["/entrypoint.sh"]
