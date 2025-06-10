#!/bin/bash
# File: create_project_structure.sh
# Name: Project Structure Creator Script
# Description: Sets up a new project directory with a standard structure.
# Author: Bocaletto Luca
# Usage: ./create_project_structure.sh PROJECT_NAME
# Example: ./create_project_structure.sh MyNewProject

if [ -z "$1" ]; then
    echo "Usage: $0 PROJECT_NAME"
    exit 1
fi

PROJECT="$1"
mkdir -p "$PROJECT"/{src,docs,assets,tests}

cat <<EOF > "$PROJECT/README.md"
# $PROJECT

A new project created on $(date +'%Y-%m-%d').

## Project Structure

- **src/**: Source code.
- **docs/**: Documentation.
- **assets/**: Images and other assets.
- **tests/**: Test scripts and files.
EOF

echo "Project structure for '$PROJECT' created successfully."
