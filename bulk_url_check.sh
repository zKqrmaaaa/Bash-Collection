#!/bin/bash
# File: bulk_url_check.sh
# Name: Bulk URL Status Checker
# Description: Reads a list of URLs from a file and checks the HTTP status code for each URL, saving the results to a CSV file.
# Author: Bocaletto Luca
# Usage: ./bulk_url_check.sh url_list.txt output.csv

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 url_list.txt output.csv"
    exit 1
fi

URL_FILE="$1"
OUTPUT_CSV="$2"

if [ ! -f "$URL_FILE" ]; then
    echo "Error: File $URL_FILE does not exist."
    exit 1
fi

echo "URL,Status" > "$OUTPUT_CSV"

while IFS= read -r url; do
    if [ -n "$url" ]; then
        STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$url")
        echo "\"$url\",$STATUS" >> "$OUTPUT_CSV"
        echo "Checked: $url -> Status: $STATUS"
    fi
done < "$URL_FILE"

echo "Results saved to $OUTPUT_CSV"
