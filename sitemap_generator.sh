#!/bin/bash
# File: sitemap_generator.sh
# Name: Sitemap Generator Script
# Description: Generates an XML sitemap for all HTML files in the specified directory.
# Author: Bocaletto Luca
# Usage: ./sitemap_generator.sh /path/to/website

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/website"
    exit 1
fi

WEBSITE_DIR="$1"
SITEMAP="sitemap.xml"

echo '<?xml version="1.0" encoding="UTF-8"?>' > "$SITEMAP"
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> "$SITEMAP"

find "$WEBSITE_DIR" -type f -iname "*.html" | while read file; do
    URL_PATH=$(realpath --relative-to="$WEBSITE_DIR" "$file" | sed 's/ /%20/g')
    echo "  <url><loc>http://example.com/$URL_PATH</loc></url>" >> "$SITEMAP"
done

echo '</urlset>' >> "$SITEMAP"

echo "Sitemap generated: $SITEMAP"
