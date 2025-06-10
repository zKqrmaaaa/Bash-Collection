#!/bin/bash
# File: backup_folder.sh
# Name: Folder Backup Script
# Description: Creates a tar.gz archive backup of a specified directory, appending the current date.
# Author: Bocaletto Luca
# Usage: ./backup_folder.sh /path/to/directory

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

DIR="$1"
BACKUP_DIR="$HOME/backup"
DATE=$(date +'%Y-%m-%d')
FILENAME="$(basename "$DIR")-$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$FILENAME" -C "$(dirname "$DIR")" "$(basename "$DIR")"

echo "Backup complete: $BACKUP_DIR/$FILENAME"
