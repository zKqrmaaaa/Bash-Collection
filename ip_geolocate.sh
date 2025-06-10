#!/bin/bash
# File: ip_geolocate.sh
# Name: IP Geolocation Lookup Script
# Description: Retrieves geolocation information for the specified IP address using the ipinfo.io API.
# Author: Bocaletto Luca
# Usage: ./ip_geolocate.sh <IP_ADDRESS>
# Example: ./ip_geolocate.sh 8.8.8.8

if [ -z "$1" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP="$1"
curl -s "https://ipinfo.io/$IP/json" | jq .
