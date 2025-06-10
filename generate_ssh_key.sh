#!/bin/bash
# File: generate_ssh_key.sh
# Name: SSH Key Generator Script
# Description: Generates a new SSH key pair using ssh-keygen with the provided email as a label.
# Author: Bocaletto Luca
# Usage: ./generate_ssh_key.sh your.email@example.com
# Example: ./generate_ssh_key.sh bob@example.com

if [ -z "$1" ]; then
    echo "Usage: $0 your.email@example.com"
    exit 1
fi

EMAIL="$1"
KEY_PATH="$HOME/.ssh/id_rsa"

if [ -f "$KEY_PATH" ]; then
    echo "A key already exists at $KEY_PATH. Back it up before generating a new one, or specify a different file."
    exit 1
fi

ssh-keygen -t rsa -b 4096 -C "$EMAIL"
echo "SSH key generated. Default location: $KEY_PATH"
