#!/bin/bash
# File: log_error_watcher.sh
# Name: Log File Error Watcher Script
# Description: Tails a log file in real time and alerts if a line containing "error" (case-insensitive) is detected.
# Author: Bocaletto Luca
# Usage: ./log_error_watcher.sh /path/to/logfile.log

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/logfile.log"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file $LOGFILE does not exist."
    exit 1
fi

echo "Monitoring $LOGFILE for errors..."
tail -F "$LOGFILE" | while read -r line; do
    if echo "$line" | grep -qi "error"; then
        echo "ALERT: $(date): $line"
    fi
done
