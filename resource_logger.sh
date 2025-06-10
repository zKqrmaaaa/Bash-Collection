#!/bin/bash
# File: resource_logger.sh
# Name: System Resource Logger
# Description: Logs system CPU load, memory usage, and disk usage to a CSV file at specified intervals.
# Author: Bocaletto Luca
# Usage: ./resource_logger.sh interval_in_seconds output.csv
# Example: ./resource_logger.sh 60 resource_log.csv

if [ $# -ne 2 ]; then
    echo "Usage: $0 interval_in_seconds output.csv"
    exit 1
fi

INTERVAL="$1"
OUTPUT="$2"

# Print header if file doesn't exist
if [ ! -f "$OUTPUT" ]; then
    echo "Timestamp,Load_avg,Memory_Used,Memory_Total,Disk_Used,Disk_Total" > "$OUTPUT"
fi

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    LOAD=$(uptime | awk -F'load average:' '{print $2}' | cut -d, -f1 | xargs)
    MEM_TOTAL=$(free -m | awk '/^Mem:/{print $2}')
    MEM_USED=$(free -m | awk '/^Mem:/{print $3}')
    DISK_USED=$(df -m / | tail -1 | awk '{print $3}')
    DISK_TOTAL=$(df -m / | tail -1 | awk '{print $2}')
    echo "$TIMESTAMP,$LOAD,$MEM_USED,$MEM_TOTAL,$DISK_USED,$DISK_TOTAL" >> "$OUTPUT"
    sleep "$INTERVAL"
done
