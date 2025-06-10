#!/bin/bash
# File: pdf_merger.sh
# Name: Batch PDF Merger Script
# Description: Merges all PDF files in the specified directory into a single output PDF.
# Author: Bocaletto Luca
# Requirements: pdftk must be installed (e.g., sudo apt install pdftk).
# Usage: ./pdf_merger.sh /path/to/pdf_directory output.pdf

if [ $# -ne 2 ]; then
    echo "Usage: $0 /path/to/pdf_directory output.pdf"
    exit 1
fi

PDF_DIR="$1"
OUTPUT_PDF="$2"

if [ ! -d "$PDF_DIR" ]; then
    echo "Directory not found: $PDF_DIR"
    exit 1
fi

PDF_FILES=("$PDF_DIR"/*.pdf)
if [ ${#PDF_FILES[@]} -eq 0 ]; then
    echo "No PDF files found in $PDF_DIR."
    exit 1
fi

pdftk "$PDF_DIR"/*.pdf cat output "$OUTPUT_PDF"

if [ $? -eq 0 ]; then
    echo "PDFs merged successfully into $OUTPUT_PDF."
else
    echo "Error merging PDF files."
fi
