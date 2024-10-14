#!/bin/ash
echo ">>> Environment setup starting..."

# Fix permissions if necessary
#chown -R root:root /mnt/server

# Ensure we're in the correct directory
cd /mnt/server

# Debugging: Check current directory and list files
echo "Current directory: $(pwd)"
ls -la /mnt/server

# Start the server (if the egg doesn't handle it)
./start-minicontrol.sh

echo ">>> Environment setup complete. Server starting..."
