#!/bin/bash
# File: file_integrity_monitor.sh
# Name: File Integrity Monitor Script
# Description: Computes SHA256 checksums for files in a directory and compares them against a baseline.
#              On first run, the baseline is generated. Subsequent runs report differences.
# Author: Bocaletto Luca
# Usage: ./file_integrity_monitor.sh /path/to/directory [checksum_file]

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory [checksum_file]"
    exit 1
fi

TARGET_DIR="$1"
CHECKSUM_FILE="${2:-integrity.hash}"

# Generate current checksums (sorted for consistent order)
CURRENT_CHECKSUMS=$(find "$TARGET_DIR" -type f -exec sha256sum {} \; | sort)

if [ ! -f "$CHECKSUM_FILE" ]; then
    echo "$CURRENT_CHECKSUMS" > "$CHECKSUM_FILE"
    echo "Baseline checksum file created: $CHECKSUM_FILE"
else
    # Compare current checksums with stored baseline
    DIFF_OUTPUT=$(diff <(echo "$CURRENT_CHECKSUMS") "$CHECKSUM_FILE")
    if [ -z "$DIFF_OUTPUT" ]; then
        echo "No changes detected in $TARGET_DIR."
    else
        echo "Changes detected in $TARGET_DIR:"
        echo "$DIFF_OUTPUT"
    fi
fi
