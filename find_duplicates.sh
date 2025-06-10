#!/bin/bash
# File: find_duplicates.sh
# Name: Duplicate Files Finder
# Description: Recursively scans a directory and identifies duplicate files by comparing their MD5 checksums.
# Author: Bocaletto Luca
# Usage: ./find_duplicates.sh /path/to/directory

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

TARGET_DIR="$1"

declare -A filehashes

find "$TARGET_DIR" -type f | while read -r file; do
    hash=$(md5sum "$file" | awk '{print $1}')
    if [[ -n "${filehashes[$hash]}" ]]; then
        echo "Duplicate found:"
        echo "   ${filehashes[$hash]}"
        echo "   $file"
    else
        filehashes["$hash"]="$file"
    fi
done
