#!/bin/bash
# File: pkg_installer.sh
# Name: Debian Package Installer Script
# Description: Installs one or more packages on Debian/Ubuntu systems using apt-get.
# Author: Bocaletto Luca
# Usage: ./pkg_installer.sh package1 package2 ...
# Example: ./pkg_installer.sh curl wget git

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 package1 package2 ..."
    exit 1
fi

echo "Updating package repository..."
sudo apt-get update

for pkg in "$@"; do
    echo "Installing $pkg..."
    sudo apt-get install -y "$pkg"
done

echo "Installation of packages completed."
