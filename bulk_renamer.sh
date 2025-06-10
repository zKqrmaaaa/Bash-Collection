#!/bin/bash
# File: bulk_renamer.sh
# Name: Bulk File Renamer
# Description: Renames all files in a directory by adding a specified prefix.
# Author: Bocaletto Luca
# Usage: ./bulk_renamer.sh /path/to/directory prefix_

if [ $# -ne 2 ]; then
    echo "Usage: $0 /path/to/directory prefix_"
    exit 1
fi

DIR="$1"
PREFIX="$2"

for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        base=$(basename "$file")
        mv "$file" "$DIR/$PREFIX$base"
        echo "Renamed: $base -> $PREFIX$base"
    fi
done
