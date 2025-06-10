#!/bin/bash
# File: cli_calculator.sh
# Name: CLI Calculator Script
# Description: Evaluates an arithmetic expression passed as an argument using bc.
# Author: Bocaletto Luca
# Usage: ./cli_calculator.sh "expression"
# Example: ./cli_calculator.sh "3.5 * (2 + 4.5)"

if [ -z "$1" ]; then
    echo "Usage: $0 \"expression\""
    exit 1
fi

EXPRESSION="$1"
RESULT=$(echo "scale=4; $EXPRESSION" | bc -l)
echo "Result: $RESULT"
