#!/bin/bash

set -e
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd "${DIR}"

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then

    # Try to get a read-only one from composer, since that likely has one
    if command -v composer &> /dev/null; then
        composer_token=$(composer config -g github-oauth.github.com)
        if [ -n "$composer_token" ]; then
            GITHUB_TOKEN="$composer_token"
        fi
    fi

    if [ -z "$GITHUB_TOKEN" ]; then
        echo "Error: GITHUB_TOKEN is not set. Please set GITHUB_TOKEN before running this script."
        exit 1
    fi
fi

# touch for permissions
touch .lycheecache
docker run --init -it --rm -e GITHUB_TOKEN="$GITHUB_TOKEN" -w /handbook -v $(pwd):/handbook lycheeverse/lychee docs
