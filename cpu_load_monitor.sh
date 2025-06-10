#!/bin/bash
# File: cpu_load_monitor.sh
# Name: CPU Load Monitor Script
# Description: Monitors CPU load average (5-min) and alerts if it exceeds a specified threshold.
# Author: Bocaletto Luca
# Usage: ./cpu_load_monitor.sh THRESHOLD
# Example: ./cpu_load_monitor.sh 2.0

if [ -z "$1" ]; then
    echo "Usage: $0 THRESHOLD"
    exit 1
fi

THRESHOLD="$1"
LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | awk -F, '{ print $2 }' | sed 's/ //g')

echo "Current 5-minute load average: $LOAD"
cmp=$(echo "$LOAD > $THRESHOLD" | bc -l)
if [ "$cmp" -eq 1 ]; then
    echo "Warning: CPU load average is above $THRESHOLD!"
else
    echo "CPU load is within acceptable limits."
fi
