#!/bin/bash
# File: self_update.sh
# Name: Auto Self-Update Script
# Description: Updates the local git repository by pulling new changes from the remote.
# Author: Bocaletto Luca
# Usage: Run this script within a git repository: ./self_update.sh

if [ ! -d .git ]; then
    echo "This script must be run within a git repository."
    exit 1
fi

echo "Checking for updates..."
git pull --rebase
if [ $? -eq 0 ]; then
    echo "Repository updated successfully."
else
    echo "Error updating repository."
fi
