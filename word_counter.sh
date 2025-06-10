#!/bin/bash
# File: word_counter.sh
# Name: Word Counter Script
# Description: Recursively counts the total number of words in all text (*.txt) files within a specified directory.
# Author: Bocaletto Luca
# Usage: ./word_counter.sh /path/to/directory
# Example: ./word_counter.sh ~/Documents

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIRECTORY="$1"

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory $DIRECTORY does not exist."
    exit 1
fi

TOTAL_WORDS=0

while IFS= read -r -d '' file; do
    WORDS=$(wc -w < "$file")
    echo "File: $file -> $WORDS words"
    TOTAL_WORDS=$(( TOTAL_WORDS + WORDS ))
done < <(find "$DIRECTORY" -type f -iname "*.txt" -print0)

echo "Total words in all text files: $TOTAL_WORDS"
