#!/bin/bash
# File: convert_images.sh
# Name: Image Conversion Script
# Description: Converts all PNG images within a directory to JPEG format.
# Author: Bocaletto Luca
# Usage: ./convert_images.sh /path/to/directory
# Example: ./convert_images.sh ~/Pictures/png_folder

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

# Convert .png files to .jpg in-place (creates new files)
find "$DIRECTORY" -maxdepth 1 -type f -iname '*.png' | while read -r file; do
    filename=$(basename "$file" .png)
    convert "$file" "$DIRECTORY/${filename}.jpg" && echo "Converted $file to ${filename}.jpg"
done
