#!/bin/bash
# File: cpu_temperature_monitor.sh
# Name: CPU Temperature Monitor Script
# Description: Checks CPU temperature using lm-sensors and alerts if it exceeds the specified threshold.
# Author: Bocaletto Luca
# Usage: ./cpu_temperature_monitor.sh THRESHOLD
# Example: ./cpu_temperature_monitor.sh 70

if [ -z "$1" ]; then
    echo "Usage: $0 THRESHOLD"
    exit 1
fi

THRESHOLD="$1"

if ! command -v sensors &> /dev/null; then
    echo "lm-sensors is not installed. Please install it (e.g., sudo apt install lm-sensors) and run 'sensors-detect'."
    exit 1
fi

# Get the current CPU temperature from sensors
TEMP=$(sensors | awk '/^Package id 0:/ {print $4}' | tr -d '+°C')
if [ -z "$TEMP" ]; then
    echo "Could not retrieve CPU temperature."
    exit 1
fi

echo "Current CPU Temperature: ${TEMP}°C"

if (( $(echo "$TEMP > $THRESHOLD" | bc -l) )); then
    echo "Warning: CPU temperature exceeds ${THRESHOLD}°C!"
else
    echo "CPU temperature is within acceptable limits."
fi
