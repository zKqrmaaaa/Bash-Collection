#!/bin/bash
# File: folder_sync.sh
# Name: Folder Synchronization Script
# Description: Synchronizes a source directory with a destination directory.
# Author: Bocaletto Luca
# Usage: ./folder_sync.sh /path/to/source /path/to/destination

if [ $# -ne 2 ]; then
    echo "Usage: $0 source_directory destination_directory"
    exit 1
fi

SOURCE="$1"
DESTINATION="$2"

rsync -av --delete "$SOURCE" "$DESTINATION"

echo "Synchronization complete: $SOURCE has been synced with $DESTINATION."
