#!/bin/bash
# File: git_branch_cleaner.sh
# Name: Git Branch Cleaner Script
# Description: Deletes local Git branches that have been merged into master/main, preserving master/main and the current branch.
# Author: Bocaletto Luca
# Usage: ./git_branch_cleaner.sh

# Ensure we are in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "This is not a Git repository."
    exit 1
fi

# Determine the main branch - adjust as needed (master or main)
MAIN_BRANCH="master"
if git show-ref --verify --quiet refs/heads/main; then
  MAIN_BRANCH="main"
fi

# Checkout the main branch before cleaning
git checkout "$MAIN_BRANCH" || { echo "Failed to checkout $MAIN_BRANCH"; exit 1; }
echo "Cleaning branches merged into $MAIN_BRANCH..."
git branch --merged | grep -vE "(^\*|$MAIN_BRANCH)" | xargs -n 1 git branch -d

echo "Local branch cleanup complete."
