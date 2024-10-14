FROM alpine:latest

ENV DEBIAN_FRONTEND=noninteractive

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
USER container
ENV USER=container HOME=/home/container
WORKDIR /

# Copy the entrypoint and start-minicontrol.sh scripts
COPY ./entrypoint.sh /entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Convert line endings for scripts and set permissions
RUN dos2unix /entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /entrypoint.sh /home/container/start-minicontrol.sh

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
