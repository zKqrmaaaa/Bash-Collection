#!/bin/bash
# File: md_to_html.sh
# Name: Markdown to HTML Converter Script
# Description: Converts a Markdown file to HTML using Pandoc.
# Author: Bocaletto Luca
# Requirements: Pandoc must be installed (e.g., sudo apt install pandoc).
# Usage: ./md_to_html.sh input.md output.html

if [ $# -ne 2 ]; then
    echo "Usage: $0 input.md output.html"
    exit 1
fi

INPUT_MD="$1"
OUTPUT_HTML="$2"

if [ ! -f "$INPUT_MD" ]; then
    echo "Error: Input file $INPUT_MD not found."
    exit 1
fi

pandoc "$INPUT_MD" -f markdown -t html -s -o "$OUTPUT_HTML"

if [ $? -eq 0 ]; then
    echo "Conversion successful: $OUTPUT_HTML created."
else
    echo "Conversion failed."
fi
