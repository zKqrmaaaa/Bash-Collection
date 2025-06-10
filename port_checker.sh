#!/bin/bash
# File: port_checker.sh
# Name: Network Port Checker Script
# Description: Checks if a specified port on a host is open using netcat.
# Author: Bocaletto Luca
# Requirements: netcat (nc) must be installed.
# Usage: ./port_checker.sh hostname port

if [ $# -ne 2 ]; then
    echo "Usage: $0 hostname port"
    exit 1
fi

HOST="$1"
PORT="$2"

nc -z -w3 "$HOST" "$PORT"
if [ $? -eq 0 ]; then
    echo "Success: Port $PORT on $HOST is open."
else
    echo "Error: Port $PORT on $HOST is closed or unreachable."
fi
