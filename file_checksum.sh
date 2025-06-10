#!/bin/bash
# File: file_checksum.sh
# Name: File Checksum Generator
# Description: Computes MD5 and SHA256 checksums for a specified file.
# Author: Bocaletto Luca
# Usage: ./file_checksum.sh /path/to/file

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/file"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
    exit 1
fi

echo "Calculating checksums for $FILE..."
echo "MD5:    $(md5sum "$FILE" | awk '{print $1}')"
echo "SHA256: $(sha256sum "$FILE" | awk '{print $1}')"
