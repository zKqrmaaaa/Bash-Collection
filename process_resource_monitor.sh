#!/bin/bash
# File: process_resource_monitor.sh
# Name: Process Resource Monitor with Logging
# Description: Monitors CPU and memory usage of a specific process at given intervals and logs the output.
# Author: Bocaletto Luca
# Usage: ./process_resource_monitor.sh process_name log_file interval
# Example: ./process_resource_monitor.sh myapp usage.log 30

if [ $# -ne 3 ]; then
    echo "Usage: $0 process_name log_file interval"
    exit 1
fi

PROCESS_NAME="$1"
LOG_FILE="$2"
INTERVAL="$3"

echo "Timestamp,PID,%CPU,%MEM" > "$LOG_FILE"
while true; do
    TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
    ps -C "$PROCESS_NAME" -o pid,pcpu,pmem --no-headers | awk -v ts="$TIMESTAMP" '{print ts","$1","$2","$3}' >> "$LOG_FILE"
    sleep "$INTERVAL"
done
