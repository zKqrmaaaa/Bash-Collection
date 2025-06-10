#!/bin/bash
# File: check_website.sh
# Name: Website Connectivity Checker
# Description: Checks a website's HTTP response using curl and reports its status.
# Author: Bocaletto Luca
# Usage: ./check_website.sh https://example.com

if [ -z "$1" ]; then
    echo "Usage: $0 URL"
    exit 1
fi

URL="$1"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "The website $URL is online (HTTP 200)."
else
    echo "Error: The website $URL returned HTTP $HTTP_CODE."
fi
