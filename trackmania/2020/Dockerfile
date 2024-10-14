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

# Set container user and environment
RUN adduser -D -h /home/container container
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Copy the entrypoint and start-minicontrol.sh scripts
COPY ./entrypoint.sh /home/container/entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Debugging: list files to verify they were copied correctly
RUN ls -la /home/container

# Convert line endings for scripts
RUN dos2unix /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Set executable permissions for scripts
RUN chmod +x /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/home/container/entrypoint.sh"]
