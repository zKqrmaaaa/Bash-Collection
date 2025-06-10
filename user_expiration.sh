#!/bin/bash
# File: user_expiration.sh
# Name: User Account Expiration Checker
# Description: Checks and lists local user accounts with their password expiration info.
# Author: Bocaletto Luca
# Usage: Run as root: sudo ./user_expiration.sh

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root for full access to user information."
    exit 1
fi

echo "User Account Expiration Report"
printf "%-20s %-30s\n" "Username" "Password Expiration Date"
echo "------------------------------------------------------------"

# Loop through users in /etc/shadow (fields separated by :)
while IFS=: read -r username _ last_change _ _ _ expire _; do
    # If expire field is empty, then there is no expiration
    if [ -z "$expire" ]; then
        exp_date="Never"
    else
        # The expire field is the number of days since Jan 1, 1970
        exp_date=$(date -d "1970-01-01 +$expire days" +"%Y-%m-%d")
    fi
    printf "%-20s %-30s\n" "$username" "$exp_date"
done < /etc/shadow
