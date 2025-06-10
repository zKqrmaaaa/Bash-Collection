#!/bin/bash
# File: directory_size.sh
# Name: Directory Size Summarizer
# Description: Displays the total size of a given directory in a human-readable format.
# Author: Bocaletto Luca
# Usage: ./directory_size.sh /path/to/directory

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
    echo "Directory not found: $DIRECTORY"
    exit 1
fi

du -sh "$DIRECTORY"
