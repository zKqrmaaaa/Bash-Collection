#!/bin/bash
# File: cron_installer.sh
# Name: Cron Job Installer Script
# Description: Installs a given cron job into the current user's crontab if not already present.
# Author: Bocaletto Luca
# Usage: ./cron_installer.sh "cron_entry"
# Example: ./cron_installer.sh "0 2 * * * /path/to/script.sh"

if [ -z "$1" ]; then
    echo "Usage: $0 \"cron_entry\""
    exit 1
fi

CRON_ENTRY="$1"

# Check if the entry already exists in crontab
crontab -l 2>/dev/null | grep -Fq "$CRON_ENTRY"
if [ $? -eq 0 ]; then
    echo "Cron entry already exists."
else
    (crontab -l 2>/dev/null; echo "$CRON_ENTRY") | crontab -
    echo "Cron entry installed: $CRON_ENTRY"
fi
