#!/bin/bash
# File: ssl_expiry_check.sh
# Name: SSL Certificate Expiration Checker Script
# Description: Checks the expiration date of a domain's SSL certificate and alerts if it expires within a specified number of days.
# Author: Bocaletto Luca
# Usage: ./ssl_expiry_check.sh DOMAIN ALERT_THRESHOLD_DAYS
# Example: ./ssl_expiry_check.sh example.com 30

if [ $# -ne 2 ]; then
    echo "Usage: $0 DOMAIN ALERT_THRESHOLD_DAYS"
    exit 1
fi

DOMAIN="$1"
THRESHOLD="$2"

# Get expiration date in seconds since epoch
EXPIRY_DATE=$(echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN":443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
if [ -z "$EXPIRY_DATE" ]; then
    echo "Error: Could not retrieve SSL certificate for $DOMAIN."
    exit 1
fi

EXPIRY_SEC=$(date -d "$EXPIRY_DATE" +%s)
CURRENT_SEC=$(date +%s)
DIFF_DAYS=$(( (EXPIRY_SEC - CURRENT_SEC) / 86400 ))

echo "SSL certificate for $DOMAIN expires in $DIFF_DAYS day(s)."

if [ "$DIFF_DAYS" -le "$THRESHOLD" ]; then
    echo "Warning: The SSL certificate for $DOMAIN will expire within $THRESHOLD days."
else
    echo "The SSL certificate for $DOMAIN is valid for more than $THRESHOLD days."
fi
