#!/bin/bash
# File: ensure_process_running.sh
# Name: Ensure Process Running Script
# Description: Monitors a specified process at regular intervals and restarts it using a given start command if not found.
# Author: Bocaletto Luca
# Usage: ./ensure_process_running.sh process_name "start_command" interval_in_seconds
# Example: ./ensure_process_running.sh myapp "/usr/bin/myapp" 60

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 process_name \"start_command\" interval_in_seconds"
    exit 1
fi

PROCESS_NAME="$1"
START_CMD="$2"
INTERVAL="$3"

while true; do
    if pgrep -x "$PROCESS_NAME" > /dev/null; then
        echo "$(date): $PROCESS_NAME is running."
    else
        echo "$(date): $PROCESS_NAME not found. Restarting..."
        eval "$START_CMD"
    fi
    sleep "$INTERVAL"
done
