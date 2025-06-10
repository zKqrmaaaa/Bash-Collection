#!/bin/bash
# File: mysql_backup.sh
# Name: MySQL Database Backup Script
# Description: Creates a backup of a specified MySQL database using mysqldump.
# Author: Bocaletto Luca
# Usage: ./mysql_backup.sh DB_NAME USER PASSWORD
# Example: ./mysql_backup.sh mydatabase myuser mypassword

if [ $# -ne 3 ]; then
    echo "Usage: $0 DB_NAME USER PASSWORD"
    exit 1
fi

DB_NAME="$1"
USER="$2"
PASSWORD="$3"
BACKUP_FILE="${DB_NAME}_$(date +'%Y-%m-%d').sql.gz"

mysqldump -u "$USER" -p"$PASSWORD" "$DB_NAME" | gzip > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Database backup successful: $BACKUP_FILE"
else
    echo "Error during database backup."
fi
