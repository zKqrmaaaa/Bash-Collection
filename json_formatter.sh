#!/bin/bash
# File: json_formatter.sh
# Name: JSON Formatter Script
# Description: Formats a JSON file using jq for human-friendly output.
# Author: Bocaletto Luca
# Requirements: jq must be installed (e.g., sudo apt install jq).
# Usage: ./json_formatter.sh input.json > output.json

if [ -z "$1" ]; then
    echo "Usage: $0 input.json"
    exit 1
fi

INPUT_FILE="$1"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File $INPUT_FILE does not exist."
    exit 1
fi

jq . "$INPUT_FILE"
