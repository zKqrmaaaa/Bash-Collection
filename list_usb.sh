#!/bin/bash
# File: list_usb.sh
# Name: USB Devices Listing Script
# Description: Lists all USB devices currently connected to the system.
# Author: Bocaletto Luca
# Usage: ./list_usb.sh

if ! command -v lsusb &> /dev/null; then
    echo "Error: lsusb command not found. It is usually part of the usbutils package."
    exit 1
fi

echo "Listing USB devices..."
lsusb
