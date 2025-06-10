#!/bin/bash
# File: video_converter.sh
# Name: Video File Converter Script
# Description: Converts a video file to a specified format using ffmpeg.
# Author: Bocaletto Luca
# Requirements: ffmpeg must be installed.
# Usage: ./video_converter.sh input_video output_format
# Example: ./video_converter.sh input.avi mp4

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input_video output_format"
    exit 1
fi

INPUT_VIDEO="$1"
OUTPUT_FORMAT="$2"
BASENAME=$(basename "$INPUT_VIDEO" | sed 's/\.[^.]*$//')
OUTPUT_VIDEO="${BASENAME}.${OUTPUT_FORMAT}"

ffmpeg -i "$INPUT_VIDEO" "$OUTPUT_VIDEO"

if [ $? -eq 0 ]; then
    echo "Conversion successful: $OUTPUT_VIDEO created."
else
    echo "Error during conversion."
fi
