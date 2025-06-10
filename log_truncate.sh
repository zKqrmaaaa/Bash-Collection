#!/bin/bash
# File: log_truncate.sh
# Name: Log File Truncator
# Description: Truncates (clears) the contents of a specified log file.
# Author: Bocaletto Luca
# Usage: ./log_truncate.sh /path/to/logfile.log

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/logfile.log"
    exit 1
fi

LOGFILE="$1"

if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file '$LOGFILE' not found."
    exit 1
fi

: > "$LOGFILE"
echo "Log file '$LOGFILE' has been truncated."
