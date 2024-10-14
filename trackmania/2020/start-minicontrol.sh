#!/bin/ash
echo ">>> Starting Trackmania server..."
cd /mnt/server
./TrackmaniaServer /title=Trackmania /game_settings=MatchSettings/tracklist.txt /dedicated_cfg=dedicated_cfg.txt /nodaemon &

echo ">>> Starting MiniControl..."
cd /home/container/minicontrol
tsx --env-file=.env core/minicontrol.ts &

minicontrol_pid=$!

echo ">>> Both Trackmania and MiniControl are running. Type '!stop' to stop the servers."

while [[ $INPUT != "!stop" ]]; do
    eval $INPUT
    read INPUT
done

echo ">>> Stopping Trackmania server..."
trackmania_pid=$(pgrep -f ./TrackmaniaServer)
kill $trackmania_pid

echo ">>> Stopping MiniControl..."
kill $minicontrol_pid

echo ">>> Both servers stopped."
