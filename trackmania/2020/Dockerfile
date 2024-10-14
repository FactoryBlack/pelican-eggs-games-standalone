FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt update && apt install -y \
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

# Set correct ownership to container user before running dos2unix
RUN chown container:container /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Convert line endings for scripts
RUN dos2unix /home/container/entrypoint.sh /home/container/start-minicontrol.sh

# Set executable permissions for scripts
RUN chmod +x /home/container/entrypoint.sh /home/container/start-minicontrol.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Debugging: list files to verify they were copied correctly
RUN ls -la /home/container

# Set the entrypoint script
ENTRYPOINT ["/bin/sh", "/home/container/entrypoint.sh"]
