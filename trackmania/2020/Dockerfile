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

# Copy the scripts and make them executable
COPY ./entrypoint.sh /home/container/entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Convert line endings and set executable permissions
RUN dos2unix /home/container/entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /home/container/entrypoint.sh /home/container/start-minicontrol.sh

ENTRYPOINT ["/bin/sh", "/home/container/entrypoint.sh"]
