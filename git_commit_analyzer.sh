#!/bin/bash
# File: git_commit_analyzer.sh
# Name: Git Repository Commit Analyzer
# Description: Analyzes the commit history of a Git repository and reports commits per author.
# Author: Bocaletto Luca
# Usage: Run this script inside a Git repository with: ./git_commit_analyzer.sh

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "This script must be run within a Git repository."
    exit 1
fi

echo "Commit count per author in the repository:"
git log --pretty=format:"%an" | sort | uniq -c | sort -nr
