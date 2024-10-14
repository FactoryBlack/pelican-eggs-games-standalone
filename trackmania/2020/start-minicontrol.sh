#!/bin/bash

# Function to stop the server using the stop command
stop_server() {
    echo ">>> Stopping Trackmania and MiniControl..."

    # Find the PID of the Trackmania server and stop it
    pid=$(pgrep -f ./server/TrackmaniaServer)
    if [ -n "$pid" ]; then
        kill $pid
        echo ">>> Trackmania server stopped..."
    else
        echo ">>> Trackmania server is not running."
    fi

    # Find the PID of MiniControl and stop it
    minicontrol_pid=$(pgrep -f minicontrol)
    if [ -n "$minicontrol_pid" ]; then
        kill $minicontrol_pid
        echo ">>> MiniControl stopped..."
    else
        echo ">>> MiniControl is not running."
    fi

    echo ">>> All services stopped."
    exit 0
}

# Start Trackmania server
echo ">>> Starting Trackmania server..."
cd /home/container
./server/TrackmaniaServer /title=Trackmania /game_settings=Matchsettings/tracklist.txt /dedicated_cfg=dedicated_cfg.txt /nodaemon &

# Wait for a few seconds to allow the Trackmania server to initialize
sleep 10

# Start MiniControl with environment variables
env $(cat /home/container/minicontrol/.env | xargs) tsx core/minicontrol.ts &

# Start MiniControl
echo ">>> Starting MiniControl..."
cd /home/container/minicontrol
npm start &

# Keep the process running and listen for commands
echo ">>> Both Trackmania and MiniControl are running. Type '!stop' to stop the servers."

# Continuously listen for the '!stop' command to gracefully stop both services
while [[ $INPUT != "!stop" ]]; do
    read -p "> " INPUT
    eval $INPUT
done

# Call stop_server when '!stop' is entered
stop_server
