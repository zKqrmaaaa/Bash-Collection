#!/bin/bash
# File: log_aggregator.sh
# Name: System Log Aggregator Script
# Description: Searches multiple log files for a given pattern and writes matching entries to an output file.
# Author: Bocaletto Luca
# Usage: ./log_aggregator.sh "pattern" output_file log_file1 log_file2 ...
# Example: ./log_aggregator.sh "error" aggregated.log /var/log/syslog /var/log/auth.log

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 \"pattern\" output_file log_file1 [log_file2 ...]"
    exit 1
fi

PATTERN="$1"
OUTPUT_FILE="$2"
shift 2

echo "Aggregating lines containing '$PATTERN'..." > "$OUTPUT_FILE"
for logfile in "$@"; do
    if [ -f "$logfile" ]; then
        echo "----- $logfile -----" >> "$OUTPUT_FILE"
        grep -i "$PATTERN" "$logfile" >> "$OUTPUT_FILE"
    else
        echo "Warning: Log file '$logfile' not found." >> "$OUTPUT_FILE"
    fi
done

echo "Aggregation complete. Output written to $OUTPUT_FILE"
