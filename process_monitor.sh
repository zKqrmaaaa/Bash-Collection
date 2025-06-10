#!/bin/bash
# File: process_monitor.sh
# Name: Process Monitor and Auto-Restart
# Description: Monitors a specific process; if not running, attempts to restart it.
# Author: Bocaletto Luca
# Usage: ./process_monitor.sh process_name "start_command"
# Example: ./process_monitor.sh apache2 "sudo systemctl start apache2"

if [ $# -ne 2 ]; then
    echo "Usage: $0 process_name \"start_command\""
    exit 1
fi

PROCESS_NAME="$1"
START_CMD="$2"

if pgrep -x "$PROCESS_NAME" > /dev/null; then
    echo "Process $PROCESS_NAME is running."
else
    echo "Process $PROCESS_NAME is not running. Restarting..."
    eval "$START_CMD"
fi
