#! /usr/bin/env bash
defaultuser="liuyang1"
repo="$1"

if [[ "$repo" == "" ]]; then
    echo "Usage: $(basename "$0") [RepoName]"
    exit 1
fi
if [[ "$repo" != */* ]]; then
    repo="$defaultuser/$repo"
fi
cmd="git clone https://github.com/$repo.git"
echo "$cmd"
eval "$cmd"
