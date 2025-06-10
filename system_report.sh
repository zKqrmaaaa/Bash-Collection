#!/bin/bash
# File: system_report.sh
# Name: System Information Report
# Description: Displays essential system information including hostname, uptime, CPU model, memory, and disk usage.
# Author: Bocaletto Luca
# Usage: ./system_report.sh

echo "=== System Information Report ==="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "CPU Model: $(lscpu | grep 'Model name:' | sed 's/Model name:\s*//')"
echo "Memory Usage:"
free -h
echo "Disk Usage for root partition:"
df -h /
echo "==================================="
