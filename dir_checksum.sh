#!/bin/bash
# File: dir_checksum.sh
# Name: Directory Content Checksum Script
# Description: Computes a single SHA256 checksum representing the content of a directory.
# Author: Bocaletto Luca
# Usage: ./dir_checksum.sh /path/to/directory

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist."
    exit 1
fi

# Compute individual file checksums, sort them, then compute a combined checksum
CHECKSUM=$(find "$TARGET_DIR" -type f -exec sha256sum {} \; | sort | sha256sum | awk '{print $1}')
echo "Combined checkpoint for $TARGET_DIR: $CHECKSUM"
