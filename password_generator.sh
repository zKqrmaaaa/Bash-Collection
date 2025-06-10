#!/bin/bash
# File: password_generator.sh
# Name: Strong Password Generator Script
# Description: Generates a strong random password using OpenSSL.
# Author: Bocaletto Luca
# Usage: ./password_generator.sh [length]
# Example: ./password_generator.sh 20

LENGTH=${1:-16}

# Generate a base64 password of the specified length. Remove any non-alphanumeric characters.
PASSWORD=$(openssl rand -base64 $((LENGTH * 3 / 4)) | tr -dc 'A-Za-z0-9' | cut -c1-$LENGTH)

echo "Generated password: $PASSWORD"
