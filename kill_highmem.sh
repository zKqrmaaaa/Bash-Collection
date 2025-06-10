#!/bin/bash
# File: kill_highmem.sh
# Name: High Memory Process Killer Script
# Description: Lists processes that exceed a specified memory usage percentage and offers an option to kill them.
# Author: Bocaletto Luca
# Usage: ./kill_highmem.sh MEMORY_THRESHOLD
# Example: ./kill_highmem.sh 10

if [ -z "$1" ]; then
    echo "Usage: $0 MEMORY_THRESHOLD"
    exit 1
fi

THRESHOLD="$1"

echo "Processes using more than ${THRESHOLD}% memory:"
ps aux --sort=-%mem | awk -v threshold="$THRESHOLD" 'NR>1 { if ($4+0 >= threshold) { printf "PID: %s CPU: %s%% MEM: %s%% CMD: %s\n", $2, $3, $4, $11 } }'

echo "Enter PID to kill (or press Enter to exit): "
read -r PID

if [ -n "$PID" ]; then
    kill "$PID" && echo "Process $PID has been terminated." || echo "Failed to kill process $PID."
else
    echo "No process terminated."
fi
