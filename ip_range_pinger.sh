#!/bin/bash
# File: ip_range_pinger.sh
# Name: IP Range Pinger Script
# Description: Pings IP addresses from a given start to an end within the same subnet and reports the responsive hosts.
# Author: Bocaletto Luca
# Usage: ./ip_range_pinger.sh start_ip end_ip
# Example: ./ip_range_pinger.sh 192.168.1.1 192.168.1.254

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 start_ip end_ip"
    exit 1
fi

START_IP="$1"
END_IP="$2"

# Extract the base (subnet) and last octet of the start and end addresses
BASE=$(echo "$START_IP" | awk -F. '{print $1"."$2"."$3"."}')
START_OCTET=$(echo "$START_IP" | awk -F. '{print $4}')
END_OCTET=$(echo "$END_IP" | awk -F. '{print $4}')

echo "Pinging IPs in range $START_IP to $END_IP ..."
for (( i=START_OCTET; i<=END_OCTET; i++ )); do
    IP="${BASE}${i}"
    ping -c 1 -W 1 "$IP" &> /dev/null
    if [ $? -eq 0 ]; then
        echo "$IP is up"
    else
        echo "$IP is down"
    fi
done
