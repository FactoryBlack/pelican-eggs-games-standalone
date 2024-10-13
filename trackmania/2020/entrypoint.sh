#!/bin/ash

# Navigate to the working directory
cd /mnt/server

# Fix potential permissions issues
if [[ -d /mnt/server ]]; then
    echo ">>> Fixing permissions..."
    chown -R container:container /mnt/server
fi

# Run the install script to ensure everything is installed at runtime
if [ ! -f /mnt/server/.setupfinished ]; then
    echo ">>> Running install script for Trackmania and MiniControl..."
    /mnt/server/install.sh
    
    # Mark setup as complete
    touch /mnt/server/.setupfinished
else
    echo ">>> Installation already completed. Skipping install."
fi

# Finally, start the Trackmania server and MiniControl using the start script
echo ">>> Starting Trackmania and MiniControl servers..."
/mnt/server/start.sh
