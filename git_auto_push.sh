#!/bin/bash
# File: git_auto_push.sh
# Name: Git Auto Commit & Push Script
# Description: Automates git add, commit, and push with a provided commit message.
# Author: Bocaletto Luca
# Usage: ./git_auto_push.sh "Your commit message"

if [ -z "$1" ]; then
    echo "Usage: $0 \"commit message\""
    exit 1
fi

COMMIT_MSG="$1"

git add -A
git commit -m "$COMMIT_MSG"
git push

echo "Changes committed and pushed successfully."
