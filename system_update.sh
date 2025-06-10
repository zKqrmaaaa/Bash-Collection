#!/bin/bash
# File: system_update.sh
# Name: System Update & Cleanup Script
# Description: Updates the package list, upgrades installed packages, and removes unused packages.
# Author: Bocaletto Luca
# Usage: ./system_update.sh

echo "Updating package list..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "Removing unnecessary packages..."
sudo apt autoremove -y

echo "System update and cleanup complete!"
