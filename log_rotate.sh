#!/bin/bash
# File: log_rotate.sh
# Name: Log Rotation Script
# Description: Rotates and compresses a log file if its size exceeds a defined limit.
# Author: Bocaletto Luca
# Usage: ./log_rotate.sh /path/to/logfile.log max_size
# Example: ./log_rotate.sh /var/log/myapp.log 100K

LOGFILE="$1"
MAXSIZE="$2"   # Example: 100K, 1M

if [ ! -f "$LOGFILE" ]; then
    echo "Log file not found: $LOGFILE"
    exit 1
fi

# For simplicity, assume MAXSIZE is given as 100K meaning 102400 bytes.
MAXBYTE=102400

FILE_SIZE=$(stat -c%s "$LOGFILE")
if [ "$FILE_SIZE" -ge "$MAXBYTE" ]; then
    TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
    mv "$LOGFILE" "$LOGFILE.$TIMESTAMP"
    gzip "$LOGFILE.$TIMESTAMP"
    touch "$LOGFILE"
    echo "Log rotated: $LOGFILE.$TIMESTAMP.gz"
else
    echo "Log file size is under the threshold."
fi
