#!/bin/bash
# File: wallpaper_changer.sh
# Name: Automated Wallpaper Changer
# Description: Cycles through images in the given directory as desktop wallpapers using feh.
# Author: Bocaletto Luca
# Requirements: feh must be installed (e.g., sudo apt install feh).
# Usage: ./wallpaper_changer.sh /path/to/wallpapers interval_in_seconds
# Example: ./wallpaper_changer.sh ~/Pictures/wallpapers 300

if [ $# -ne 2 ]; then
    echo "Usage: $0 /path/to/wallpapers interval_in_seconds"
    exit 1
fi

WALLPAPER_DIR="$1"
INTERVAL="$2"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Directory not found: $WALLPAPER_DIR"
    exit 1
fi

while true; do
    for wallpaper in "$WALLPAPER_DIR"/*.{jpg,jpeg,png}; do
        [ -e "$wallpaper" ] || continue
        echo "Setting wallpaper: $wallpaper"
        feh --bg-scale "$wallpaper"
        sleep "$INTERVAL"
    done
done
