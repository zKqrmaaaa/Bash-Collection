#!/bin/bash
# File: bulk_image_resize.sh
# Name: Bulk Image Resizer Script
# Description: Resizes all JPEG and PNG images in a directory to a specified width using ImageMagick.
# Author: Bocaletto Luca
# Requirements: ImageMagick (mogrify) must be installed.
# Usage: ./bulk_image_resize.sh /path/to/images width_in_pixels
# Example: ./bulk_image_resize.sh ~/Pictures 800

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 /path/to/images width_in_pixels"
    exit 1
fi

IMAGE_DIR="$1"
WIDTH="$2"

if [ ! -d "$IMAGE_DIR" ]; then
    echo "Error: Directory '$IMAGE_DIR' not found."
    exit 1
fi

mogrify -resize "${WIDTH}" "$IMAGE_DIR"/*.{jpg,jpeg,png} 2>/dev/null
echo "Images in $IMAGE_DIR have been resized to width $WIDTH pixels."
