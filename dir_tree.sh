#!/bin/bash
# File: dir_tree.sh
# Name: Directory Tree Generator
# Description: Generates a directory tree of a specified folder. If an output file is provided, saves the tree to that file.
# Author: Bocaletto Luca
# Usage: ./dir_tree.sh /path/to/directory [output_file]
# Requirements: tree must be installed (e.g., sudo apt install tree).

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory [output_file]"
    exit 1
fi

TARGET_DIR="$1"
OUTPUT_FILE="$2"

if ! command -v tree &> /dev/null; then
    echo "The command 'tree' is not installed. Please install it."
    exit 1
fi

if [ -n "$OUTPUT_FILE" ]; then
    tree "$TARGET_DIR" > "$OUTPUT_FILE"
    echo "Directory tree written to $OUTPUT_FILE"
else
    tree "$TARGET_DIR"
fi
