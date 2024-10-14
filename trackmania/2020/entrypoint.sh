# entrypoint.sh for setting up the environment and starting services
#!/bin/ash

# Debugging information
echo ">>> Environment setup starting..."
echo "Current directory: $(pwd)"
ls -la

# Fix permissions if necessary
chown -R container:container /home/container

# Ensure we're in the correct directory
cd /home/container

# Start the server (if not handled by the egg)
./start-minicontrol.sh
