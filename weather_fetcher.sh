#!/bin/bash
# File: weather_fetcher.sh
# Name: Weather Fetcher Script
# Description: Fetches current weather information from wttr.in for a specified location.
# Author: Bocaletto Luca
# Usage: ./weather_fetcher.sh [location]
# Example: ./weather_fetcher.sh London

LOCATION="${1:-}"

echo "Fetching weather information..."
if [ -z "$LOCATION" ]; then
    curl -s 'https://wttr.in?format=3'
else
    curl -s "https://wttr.in/$LOCATION?format=3"
fi
echo ""
