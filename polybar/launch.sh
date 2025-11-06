#!/usr/bin/env bash

# Kill existing Polybar instances
killall -q polybar

# Wait until they’re all gone
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Source Pywal colors
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    source "$HOME/.cache/wal/colors.sh"
fi

# Export Pywal color variables
export background foreground
for i in {0..15}; do
    export color${i}
done

# Launch Polybar on all connected monitors
for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload main &
done

