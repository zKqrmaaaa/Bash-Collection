#!/bin/bash
# File: find_replace.sh
# Name: Recursive Find and Replace
# Description: Recursively finds and replaces text in files within a given directory.
# Author: Bocaletto Luca
# Usage: ./find_replace.sh /path/to/directory "search_pattern" "replacement"
# Example: ./find_replace.sh ./src "foo" "bar"

if [ $# -ne 3 ]; then
    echo "Usage: $0 /path/to/directory \"search_pattern\" \"replacement\""
    exit 1
fi

DIRECTORY="$1"
SEARCH="$2"
REPLACE="$3"

find "$DIRECTORY" -type f -exec sed -i "s/${SEARCH}/${REPLACE}/g" {} \;

echo "Replacement complete in directory: $DIRECTORY"
