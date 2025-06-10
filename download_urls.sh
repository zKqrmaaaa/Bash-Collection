#!/bin/bash
# File: download_urls.sh
# Name: URL Downloader Script
# Description: Downloads files from a list of URLs and saves them into a target directory.
# Author: Bocaletto Luca
# Usage: ./download_urls.sh URL_FILE TARGET_DIRECTORY
# Example: ./download_urls.sh urls.txt downloads

if [ $# -ne 2 ]; then
    echo "Usage: $0 URL_FILE TARGET_DIRECTORY"
    exit 1
fi

URL_FILE="$1"
TARGET_DIR="$2"

if [ ! -f "$URL_FILE" ]; then
    echo "Error: File $URL_FILE not found."
    exit 1
fi

mkdir -p "$TARGET_DIR"
while IFS= read -r url; do
    if [ -n "$url" ]; then
        echo "Downloading $url..."
        wget -q -P "$TARGET_DIR" "$url" && echo "Downloaded: $url" || echo "Failed: $url"
    fi
done < "$URL_FILE"

echo "Downloading completed."
