#!/bin/bash
# File: process_tree_viewer.sh
# Name: Process Tree Viewer
# Description: Displays a formatted process tree. Optionally filters by a username.
# Author: Bocaletto Luca
# Usage: ./process_tree_viewer.sh [username]
# Example: ./process_tree_viewer.sh root

if ! command -v pstree &> /dev/null; then
    echo "Error: pstree not found. Please install it (e.g., sudo apt install pstree)."
    exit 1
fi

if [ -n "$1" ]; then
    echo "Process tree for user: $1"
    pstree -u "$1"
else
    echo "Complete process tree:"
    pstree -A
fi
