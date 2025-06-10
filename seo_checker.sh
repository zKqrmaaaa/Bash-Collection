#!/bin/bash
# File: seo_checker.sh
# Name: Website SEO Checker
# Description: Fetches the title and meta description of a webpage to perform basic SEO checks.
# Author: Bocaletto Luca
# Usage: ./seo_checker.sh https://example.com

if [ -z "$1" ]; then
    echo "Usage: $0 URL"
    exit 1
fi

URL="$1"

CONTENT=$(curl -s "$URL")
TITLE=$(echo "$CONTENT" | grep -oP '(?<=<title>)(.*)(?=</title>)')
META_DESC=$(echo "$CONTENT" | grep -oP '(?<=<meta name="description" content=")(.*?)(?=")' | head -1)

echo "URL: $URL"
echo "Title: $TITLE"
echo "Meta Description: $META_DESC"
