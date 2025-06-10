#!/bin/bash
# File: local_server.sh
# Name: Local Web Server Starter Script
# Description: Starts a local web server using Python's http.server module.
# Author: Bocaletto Luca
# Usage: ./local_server.sh [PORT]
# Default PORT is 8000 if not specified.

PORT=${1:-8000}
echo "Starting local web server at http://localhost:$PORT"
python3 -m http.server "$PORT"
