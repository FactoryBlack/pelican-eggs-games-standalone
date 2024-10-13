#!/bin/ash
echo ">>> Environment setup starting..."

# Fix permissions if necessary
chown -R 0:0 /mnt/server

# Ensure we're in the correct directory
cd /mnt/server

# Check or setup any necessary configuration files here

# Start the server (if the egg doesn't handle it)
./start-minicontrol.sh

echo ">>> Environment setup complete. Server starting..."
