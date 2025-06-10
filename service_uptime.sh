#!/bin/bash
# File: service_uptime.sh
# Name: Service Uptime Reporter Script
# Description: Reports the uptime and status of a specified system service using systemctl.
# Author: Bocaletto Luca
# Usage: ./service_uptime.sh service_name
# Example: ./service_uptime.sh ssh

if [ -z "$1" ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

SERVICE="$1"

# Check if the service exists
if ! systemctl status "$SERVICE" &> /dev/null; then
    echo "Service $SERVICE not found."
    exit 1
fi

echo "Service Status for $SERVICE:"
systemctl show "$SERVICE" --property=ActiveEnterTimestamp,ActiveState
