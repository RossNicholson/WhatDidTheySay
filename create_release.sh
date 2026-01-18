#!/bin/bash
# Script to create GitHub release for v0.7.0

REPO="RossNicholson/WhatDidTheySay"
TAG="v0.7.0"
TITLE="Version 0.7.0 - WoW Abbreviations Language Pack"

# Read release notes
NOTES=$(cat RELEASE_NOTES_v0.7.0.md)

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ GITHUB_TOKEN environment variable is not set"
    echo ""
    echo "To create the release, you have two options:"
    echo ""
    echo "Option 1: Set GITHUB_TOKEN and run this script"
    echo "  export GITHUB_TOKEN=your_github_token"
    echo "  bash create_release.sh"
    echo ""
    echo "Option 2: Create release manually on GitHub"
    echo "  1. Go to https://github.com/$REPO/releases/new"
    echo "  2. Select tag: $TAG"
    echo "  3. Title: $TITLE"
    echo "  4. Copy contents of RELEASE_NOTES_v0.7.0.md into description"
    echo "  5. Click 'Publish release'"
    exit 1
fi

# Create release via GitHub API
echo "Creating GitHub release..."
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/$REPO/releases \
  -d "{
    \"tag_name\": \"$TAG\",
    \"name\": \"$TITLE\",
    \"body\": $(echo "$NOTES" | jq -Rs .),
    \"draft\": false,
    \"prerelease\": false
  }"

echo ""
echo "✅ Release created! Check https://github.com/$REPO/releases"
