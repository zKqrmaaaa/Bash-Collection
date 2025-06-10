#!/bin/bash
# File: file_crypto.sh
# Name: File Encryption & Decryption Script
# Description: Encrypts or decrypts a file using OpenSSL. Specify "encrypt" or "decrypt" mode.
# Author: Bocaletto Luca
# Usage: ./file_crypto.sh encrypt|decrypt input_file output_file password
# Example: ./file_crypto.sh encrypt secret.txt secret.enc myPassword

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 encrypt|decrypt input_file output_file password"
    exit 1
fi

MODE="$1"
INPUT_FILE="$2"
OUTPUT_FILE="$3"
PASSWORD="$4"

if [ "$MODE" == "encrypt" ]; then
    openssl enc -aes-256-cbc -salt -in "$INPUT_FILE" -out "$OUTPUT_FILE" -k "$PASSWORD"
    if [ $? -eq 0 ]; then
        echo "File encrypted to $OUTPUT_FILE"
    else
        echo "Encryption failed."
    fi
elif [ "$MODE" == "decrypt" ]; then
    openssl enc -d -aes-256-cbc -in "$INPUT_FILE" -out "$OUTPUT_FILE" -k "$PASSWORD"
    if [ $? -eq 0 ]; then
        echo "File decrypted to $OUTPUT_FILE"
    else
        echo "Decryption failed."
    fi
else
    echo "Invalid mode. Use encrypt or decrypt."
    exit 1
fi
