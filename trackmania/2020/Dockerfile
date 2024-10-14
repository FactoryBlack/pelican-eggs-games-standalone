FROM alpine:3.18.4

USER root

# Install necessary packages
RUN apk update && apk add --no-cache \
    bash \
    git \
    xmlstarlet \
    jq \
    curl \
    unzip \
    nodejs \
    npm \
    dos2unix

# Set the working directory
WORKDIR /home/container

# Copy the entrypoint and start-minicontrol.sh scripts
COPY ./entrypoint.sh /entrypoint.sh
COPY ./start-minicontrol.sh /home/container/start-minicontrol.sh

# Convert line endings and set executable permissions
RUN dos2unix /entrypoint.sh /home/container/start-minicontrol.sh \
    && chmod +x /entrypoint.sh /home/container/start-minicontrol.sh

# Create the container user
RUN adduser -D -h /home/container container

# Set correct ownership to container user
RUN chown container:container /entrypoint.sh /home/container/start-minicontrol.sh

USER container
ENV USER=container HOME=/home/container

# Debugging: Check if entrypoint and startup scripts are correctly copied and executable
RUN ls -la /entrypoint.sh /home/container/start-minicontrol.sh
RUN echo "Debug: Current working directory: $(pwd)"

# Debugging: Show installed packages
RUN apk info

# Set the entrypoint script
CMD ["/bin/bash", "/entrypoint.sh"]
