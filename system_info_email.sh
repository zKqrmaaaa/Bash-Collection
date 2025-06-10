#!/bin/bash
# File: system_info_email.sh
# Name: System Info Email Report Script
# Description: Collects system information and emails the report to a specified recipient.
# Author: Bocaletto Luca
# Requirements: mail command configured (e.g., via postfix or ssmtp).
# Usage: ./system_info_email.sh recipient@example.com

if [ -z "$1" ]; then
    echo "Usage: $0 recipient@example.com"
    exit 1
fi

EMAIL="$1"
SUBJECT="System Information Report for $(hostname) at $(date +'%Y-%m-%d')"
BODY="/tmp/system_report.txt"

echo "Hostname: $(hostname)" > "$BODY"
echo "Uptime: $(uptime -p)" >> "$BODY"
echo "" >> "$BODY"
echo "CPU Information:" >> "$BODY"
lscpu >> "$BODY" 2>/dev/null
echo "" >> "$BODY"
echo "Memory Usage:" >> "$BODY"
free -h >> "$BODY"
echo "" >> "$BODY"
echo "Disk Usage:" >> "$BODY"
df -h / >> "$BODY"
echo "" >> "$BODY"
echo "Network Interfaces:" >> "$BODY"
ip addr >> "$BODY" 2>/dev/null

mail -s "$SUBJECT" "$EMAIL" < "$BODY"

if [ $? -eq 0 ]; then
    echo "System information report sent to $EMAIL."
else
    echo "Failed to send the email."
fi

rm "$BODY"
