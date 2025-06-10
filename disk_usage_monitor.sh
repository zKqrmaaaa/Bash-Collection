#!/bin/bash
# File: disk_usage_monitor.sh
# Name: Disk Usage Monitor
# Description: Monitors disk usage and alerts if usage exceeds a specified threshold.
# Author: Bocaletto Luca
# Usage: ./disk_usage_monitor.sh

THRESHOLD=90
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Warning: Disk usage is at ${USAGE}%!"
    # Optionally: send an email alert or log this event.
else
    echo "Disk usage is at ${USAGE}%. All is well."
fi
