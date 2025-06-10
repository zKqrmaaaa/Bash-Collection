#!/bin/bash
# File: file_watcher.sh
# Name: File Watcher Script
# Description: Monitors a specified file for modifications using inotifywait.
# Author: Bocaletto Luca
# Requirements: inotify-tools must be installed (e.g., sudo apt install inotify-tools).
# Usage: ./file_watcher.sh /path/to/file

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/file"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File $FILE does not exist."
    exit 1
fi

echo "Watching for changes in: $FILE"
inotifywait -m -e modify "$FILE" | while read -r directory events filename; do
    echo "Change detected in: $FILE at $(date)"
done
