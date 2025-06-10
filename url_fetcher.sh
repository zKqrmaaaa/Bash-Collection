#!/bin/bash
# File: url_fetcher.sh
# Name: URL Content Fetcher Script
# Description: Fetches and displays the contents of a URL using curl.
# Author: Bocaletto Luca
# Usage: ./url_fetcher.sh https://example.com

if [ -z "$1" ]; then
    echo "Usage: $0 URL"
    exit 1
fi

URL="$1"

echo "Fetching content from $URL ..."
curl -s "$URL"
echo ""
echo "Content fetched at: $(date)"
