#!/bin/ash
echo ">>> Environment setup starting..."

# Ensure we're in the correct directory
cd /

# Check or setup any necessary configuration files here

# Start the server (if the egg doesn't handle it)
/home/container/start-minicontrol.sh

echo ">>> Environment setup complete. Server starting..."
