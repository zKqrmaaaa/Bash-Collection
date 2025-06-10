#!/bin/bash
# File: web_screenshot.sh
# Name: Webpage Screenshot Generator Script
# Description: Captures a screenshot of a webpage using wkhtmltoimage.
# Author: Bocaletto Luca
# Requirements: wkhtmltoimage must be installed.
# Usage: ./web_screenshot.sh URL output_image
# Example: ./web_screenshot.sh https://example.com screenshot.png

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 URL output_image"
    exit 1
fi

URL="$1"
OUTPUT_IMAGE="$2"

wkhtmltoimage "$URL" "$OUTPUT_IMAGE"

if [ $? -eq 0 ]; then
    echo "Screenshot saved as $OUTPUT_IMAGE"
else
    echo "Failed to capture screenshot."
fi
