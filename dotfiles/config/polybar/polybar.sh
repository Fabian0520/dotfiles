#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have deen shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar eDP1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom
polybar DP1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom

echo message >/tmp/ipc-bottom
# polybar top &
