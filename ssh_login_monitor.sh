#!/bin/bash
# File: ssh_login_monitor.sh
# Name: SSH Login Attempt Monitor
# Description: Scans system authentication logs for failed SSH login attempts and outputs a summary.
# Author: Bocaletto Luca
# Usage: Run as sudo if necessary: sudo ./ssh_login_monitor.sh

LOGFILE="/var/log/auth.log"
if [ ! -f "$LOGFILE" ]; then
    LOGFILE="/var/log/secure"
fi

echo "Analyzing failed SSH login attempts from $LOGFILE..."
grep -i 'Failed password' "$LOGFILE" | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr
