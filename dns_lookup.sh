#!/bin/bash
# File: dns_lookup.sh
# Name: DNS Lookup Script
# Description: Looks up DNS information for a provided domain using dig or host.
# Author: Bocaletto Luca
# Usage: ./dns_lookup.sh domain.tld

if [ -z "$1" ]; then
    echo "Usage: $0 domain.tld"
    exit 1
fi

DOMAIN="$1"

if command -v dig > /dev/null; then
    echo "Using dig to lookup DNS for $DOMAIN:"
    dig "$DOMAIN" +short
elif command -v host > /dev/null; then
    echo "Using host to lookup DNS for $DOMAIN:"
    host "$DOMAIN"
else
    echo "Neither dig nor host command is installed."
    exit 1
fi
