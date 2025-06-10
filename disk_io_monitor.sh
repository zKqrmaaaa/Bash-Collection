#!/bin/bash
# File: disk_io_monitor.sh
# Name: Disk I/O Monitor Script
# Description: Monitors and prints disk I/O statistics (reads/writes per second) at specified intervals using iostat.
# Author: Bocaletto Luca
# Requirements: sysstat package (for iostat) must be installed.
# Usage: ./disk_io_monitor.sh interval_in_seconds duration_in_seconds
# Example: ./disk_io_monitor.sh 2 20

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 interval_in_seconds duration_in_seconds"
    exit 1
fi

INTERVAL="$1"
DURATION="$2"

echo "Monitoring disk I/O every $INTERVAL seconds for $DURATION seconds..."
iostat -d "$INTERVAL" "$((DURATION / INTERVAL))"
