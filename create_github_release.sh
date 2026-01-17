#!/bin/bash
# Script to create GitHub release for v0.5.0

set -e

REPO="RossNicholson/WhatDidTheySay"
TAG="v0.5.0"
TITLE="v0.5.0 - Dependency Parsing"
NOTES_FILE="RELEASE_NOTES_v0.5.0.md"

echo "Creating GitHub release for $TAG..."

# Check if GitHub CLI is installed
if command -v gh &> /dev/null; then
    echo "Using GitHub CLI..."
    gh release create "$TAG" \
        --title "$TITLE" \
        --notes-file "$NOTES_FILE" \
        --repo "$REPO"
    echo "✅ Release created successfully!"
    exit 0
fi

# Check if we have a GitHub token
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ GitHub CLI not found and GITHUB_TOKEN not set."
    echo ""
    echo "To create the release, you have two options:"
    echo ""
    echo "1. Install GitHub CLI and run: gh release create v0.5.0 --title 'v0.5.0 - Dependency Parsing' --notes-file RELEASE_NOTES_v0.5.0.md"
    echo ""
    echo "2. Use the web interface:"
    echo "   Go to: https://github.com/$REPO/releases/new"
    echo "   - Tag: $TAG"
    echo "   - Title: $TITLE"
    echo "   - Description: Copy from $NOTES_FILE"
    echo "   - Check 'Set as latest release'"
    echo "   - Click 'Publish release'"
    exit 1
fi

# Try using curl with API
echo "Using GitHub API..."
curl -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/repos/$REPO/releases" \
  -d "{
    \"tag_name\": \"$TAG\",
    \"name\": \"$TITLE\",
    \"body\": $(cat "$NOTES_FILE" | jq -Rs .),
    \"prerelease\": false,
    \"draft\": false
  }"

echo ""
echo "✅ Release created successfully!"
