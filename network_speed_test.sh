#!/bin/bash
# File: network_speed_test.sh
# Name: Network Speed Test Script
# Description: Measures network download and upload speeds using the speedtest-cli tool.
# Author: Bocaletto Luca
# Usage: ./network_speed_test.sh
# Note: Install speedtest-cli (`sudo apt install speedtest-cli` on Debian/Ubuntu)

if ! command -v speedtest-cli &> /dev/null; then
    echo "speedtest-cli is not installed. Please install it and try again."
    exit 1
fi

echo "Running network speed test..."
speedtest-cli
