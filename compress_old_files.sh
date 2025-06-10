#!/bin/bash
# File: compress_old_files.sh
# Name: Compress Old Files Script
# Description: Locates files older than a given number of days within a directory and compresses them into an archive.
# Author: Bocaletto Luca
# Usage: ./compress_old_files.sh /path/to/directory DAYS
# Example: ./compress_old_files.sh /var/log 7

if [ $# -ne 2 ]; then
    echo "Usage: $0 /path/to/directory DAYS"
    exit 1
fi

DIRECTORY="$1"
DAYS="$2"
ARCHIVE_NAME="old_files_$(date +'%Y-%m-%d').tar.gz"

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

find "$DIRECTORY" -type f -mtime +"$DAYS" -print0 | tar -czvf "$ARCHIVE_NAME" --null -T -
echo "Old files compressed into $ARCHIVE_NAME"
