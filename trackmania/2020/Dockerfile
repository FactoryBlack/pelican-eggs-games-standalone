FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages with cleanup to reduce image size
RUN apt update && apt install -y \
    git \
    xmlstarlet \
    jq \
    curl \
    unzip \
    nodejs \
    npm \
    dos2unix \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the entrypoint and start-minicontrol.sh scripts
COPY ./entrypoint.sh /home/container/entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Create the container user
RUN useradd -m -d /home/container container

# Set correct ownership to container user
RUN chown container:container /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Convert line endings and set executable permissions as root
RUN dos2unix /home/container/entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /home/container/entrypoint.sh /home/container/start-minicontrol.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Debugging: list files to verify they were copied correctly
RUN ls -la /home/container

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/home/container/entrypoint.sh"]
