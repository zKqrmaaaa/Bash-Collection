#!/bin/bash
# File: remote_sync.sh
# Name: Remote Directory Synchronization Script
# Description: Synchronizes a local directory with a directory on a remote host using rsync over SSH.
# Author: Bocaletto Luca
# Usage: ./remote_sync.sh /path/to/local_directory user@remotehost:/path/to/remote_directory

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/local_directory user@remotehost:/path/to/remote_directory"
    exit 1
fi

LOCAL_DIR="$1"
REMOTE_DIR="$2"

echo "Synchronizing from '$LOCAL_DIR' to '$REMOTE_DIR' ..."
rsync -avz --delete "$LOCAL_DIR"/ "$REMOTE_DIR"
if [ $? -eq 0 ]; then
    echo "Synchronization completed successfully."
else
    echo "An error occurred during synchronization."
fi
