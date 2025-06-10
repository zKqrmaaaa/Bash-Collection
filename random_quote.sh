#!/bin/bash
# File: random_quote.sh
# Name: Random Quote Fetcher Script
# Description: Retrieves and displays a random quote from the quotable.io API.
# Author: Bocaletto Luca
# Usage: ./random_quote.sh

QUOTE=$(curl -s https://api.quotable.io/random | jq -r '.content + " — " + .author')
if [ -n "$QUOTE" ]; then
    echo "Random Quote:"
    echo "$QUOTE"
else
    echo "Failed to fetch a quote."
fi
