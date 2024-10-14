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

# Create container user
RUN adduser -D -h /home/container container

# Set permissions for scripts before switching user
COPY ./entrypoint.sh /entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh
RUN dos2unix /entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /entrypoint.sh /home/container/start-minicontrol.sh

# Install tsx for MiniControl (run as root)
USER root
RUN npm install -g tsx

# Switch back to container user
USER container
ENV USER=container HOME=/home/container
WORKDIR /

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
