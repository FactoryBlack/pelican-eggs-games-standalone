#!/bin/ash
echo ">>> Environment setup starting..."

# Ensure we're in the correct directory
cd /home/container

# Debugging: Check current directory and list files
echo "Current directory: $(pwd)"
ls -la /home/container

# Start the server
./start-minicontrol.sh

echo ">>> Environment setup complete. Server starting..."
