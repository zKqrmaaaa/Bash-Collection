#!/bin/bash
# File: net_conn_monitor.sh
# Name: Active Network Connection Monitor Script
# Description: Lists active network connections, grouped by protocol and destination, using netstat.
# Author: Bocaletto Luca
# Usage: ./net_conn_monitor.sh

if command -v netstat &> /dev/null; then
    netstat -tunap
elif command -v ss &> /dev/null; then
    ss -tunap
else
    echo "Neither netstat nor ss is installed."
    exit 1
fi
