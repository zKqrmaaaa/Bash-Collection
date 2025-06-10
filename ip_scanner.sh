#!/bin/bash
# File: ip_scanner.sh
# Name: Simple IP Scanner
# Description: Scans a subnet (provided in CIDR notation) for active hosts using nmap.
# Author: Bocaletto Luca
# Requirements: nmap must be installed (e.g., sudo apt install nmap).
# Usage: ./ip_scanner.sh 192.168.1.0/24

if [ -z "$1" ]; then
    echo "Usage: $0 <CIDR>"
    exit 1
fi

SUBNET="$1"
echo "Scanning subnet: $SUBNET"
nmap -sn "$SUBNET"
