#!/bin/bash

# Navigate to the server directory and start the Trackmania server
echo ">>> Starting Trackmania server..."
cd /mnt/server
./server/TrackmaniaServer /title=Trackmania /game_Settings=Matchsettings/tracklist.txt /dedicated_cfg=dedicated_cfg.txt /nodaemon &

# Debugging: Check if Trackmania server started correctly
if [ $? -ne 0 ]; then
    echo "TrackmaniaServer failed to start."
    exit 1
fi

# Start MiniControl
echo ">>> Starting MiniControl..."
cd /mnt/server/minicontrol

# Load environment variables from .env and start MiniControl
env $(cat /mnt/server/minicontrol/.env | xargs) tsx core/minicontrol.ts &

# Command loop to allow for graceful server stop
while [[ $INPUT != "!stop" ]]; do
    eval $INPUT
    read INPUT
done

# Stopping Trackmania server
pid=$(pgrep -f ./server/TrackmaniaServer)
kill $pid

echo ">>> Server stopped successfully."
