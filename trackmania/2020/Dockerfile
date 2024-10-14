FROM alpine:3.18.4

USER root

# Install necessary packages
RUN apk update && apk add --no-cache \
    git \
    xmlstarlet \
    jq \
    curl \
    unzip \
    nodejs \
    npm \
    dos2unix

# Copy the entrypoint and start-minicontrol.sh scripts
COPY ./entrypoint.sh /home/container/entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Convert line endings and set executable permissions
RUN dos2unix /home/container/entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Create the container user
RUN adduser -D -h /home/container container

# Set correct ownership to container user
RUN chown container:container /home/container/entrypoint.sh /home/container/start-minicontrol.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Debugging: list files to verify they were copied correctly
RUN ls -la /home/container

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/home/container/entrypoint.sh"]
