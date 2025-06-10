#!/bin/bash
# File: env_checker.sh
# Name: Environment Variable Checker Script
# Description: Checks if the specified environment variables are set. Displays their values or prompts if any are missing.
# Author: Bocaletto Luca
# Usage: ./env_checker.sh VAR1 VAR2 ...
# Example: ./env_checker.sh PATH HOME MY_VAR

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 VAR1 VAR2 ..."
    exit 1
fi

for VAR in "$@"; do
    VALUE="${!VAR}"
    if [ -z "$VALUE" ]; then
        echo "Warning: Environment variable '$VAR' is not set."
    else
        echo "$VAR = $VALUE"
    fi
done
