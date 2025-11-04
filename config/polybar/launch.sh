#!/usr/bin/env bash

# Kill existing Polybar instances
killall -q polybar

# Wait until they’re all gone
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch on all connected monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done

# Launch Polybar and reserve space
exec_always --no-startup-id polybar top &

