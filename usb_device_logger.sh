#!/bin/bash
# File: usb_device_logger.sh
# Name: New USB Device Logger
# Description: Periodically checks connected USB devices and logs any new device detected.
# Author: Bocaletto Luca
# Usage: ./usb_device_logger.sh /path/to/logfile.log interval_in_seconds

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/logfile.log interval_in_seconds"
    exit 1
fi

LOGFILE="$1"
INTERVAL="$2"

PREV_STATE=$(mktemp)
lsusb > "$PREV_STATE"

echo "Starting USB device monitoring. Logging changes to $LOGFILE"
while true; do
    CUR_STATE=$(mktemp)
    lsusb > "$CUR_STATE"
    DIFF=$(diff "$PREV_STATE" "$CUR_STATE")
    if [ -n "$DIFF" ]; then
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] USB change detected:" >> "$LOGFILE"
        echo "$DIFF" >> "$LOGFILE"
        echo "-------------------------------------------" >> "$LOGFILE"
        cp "$CUR_STATE" "$PREV_STATE"
    fi
    rm "$CUR_STATE"
    sleep "$INTERVAL"
done
