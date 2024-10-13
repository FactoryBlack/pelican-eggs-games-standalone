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

# Set the working directory to /mnt/server
WORKDIR /mnt/server

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set executable permissions for the entrypoint script
RUN chmod +x /entrypoint.sh

# Set the entrypoint to initialize the container when it starts
ENTRYPOINT ["/entrypoint.sh"]
