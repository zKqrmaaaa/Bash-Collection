#!/bin/bash
# File: service_check_email.sh
# Name: Service Check and Email Alert Script
# Description: Checks if a service is running; if not, sends an email alert.
# Author: Bocaletto Luca
# Usage: ./service_check_email.sh SERVICE_NAME RECIPIENT_EMAIL "Start Command"
# Example: ./service_check_email.sh apache2 recipient@example.com "sudo systemctl start apache2"

if [ $# -ne 3 ]; then
    echo "Usage: $0 SERVICE_NAME RECIPIENT_EMAIL \"Start Command\""
    exit 1
fi

SERVICE="$1"
EMAIL="$2"
START_CMD="$3"

if pgrep -x "$SERVICE" > /dev/null; then
    echo "Service $SERVICE is running."
else
    echo "Service $SERVICE is not running. Sending alert email..."
    echo "The service $SERVICE is down on $(hostname) at $(date)." | mail -s "Alert: $SERVICE is down" "$EMAIL"
    echo "Attempting to restart $SERVICE..."
    eval "$START_CMD"
fi
