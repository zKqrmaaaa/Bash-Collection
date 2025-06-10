#!/bin/bash
# File: battery_monitor.sh
# Name: Battery Monitor Script
# Description: Checks battery status via acpi and warns if battery level falls below a specified threshold.
# Author: Bocaletto Luca
# Usage: ./battery_monitor.sh [threshold_percentage]
# Example: ./battery_monitor.sh 20

if ! command -v acpi &> /dev/null; then
    echo "Error: acpi command is not installed. Please install it (e.g., sudo apt install acpi)."
    exit 1
fi

STATUS=$(acpi -b)
echo "Battery status: $STATUS"

if [ -n "$1" ]; then
    THRESHOLD="$1"
    # Extract battery percentage
    PERCENTAGE=$(echo "$STATUS" | grep -o '[0-9]\+%' | tr -d '%')
    if [ "$PERCENTAGE" -le "$THRESHOLD" ]; then
        echo "Warning: Battery level is at ${PERCENTAGE}% (below threshold of $THRESHOLD%)."
    fi
fi
