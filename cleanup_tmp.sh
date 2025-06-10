#!/bin/bash
# File: cleanup_tmp.sh
# Name: Temporary Files Cleanup Script
# Description: Deletes files older than a specified number of days in a target directory.
# Author: Bocaletto Luca
# Usage: ./cleanup_tmp.sh /path/to/directory days
# Example: ./cleanup_tmp.sh /tmp 7

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/directory days"
    exit 1
fi

TARGET_DIR="$1"
DAYS="$2"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' not found."
    exit 1
fi

echo "Cleaning files older than $DAYS days in $TARGET_DIR ..."
find "$TARGET_DIR" -type f -mtime +"$DAYS" -exec rm -f {} \;
echo "Cleanup completed."
