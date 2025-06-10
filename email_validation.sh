#!/bin/bash
# File: email_validation.sh
# Name: Email Validation Script
# Description: Validates the format of an email address using a regex pattern.
# Author: Bocaletto Luca
# Usage: ./email_validation.sh email@example.com

if [ -z "$1" ]; then
    echo "Usage: $0 email@example.com"
    exit 1
fi

EMAIL="$1"
# Basic regex for email validation
regex="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"

if [[ $EMAIL =~ $regex ]]; then
    echo "Valid email: $EMAIL"
else
    echo "Invalid email: $EMAIL"
fi
