#! /usr/bin/env bash
function hub()
{
    local defaultuser="liuyang1"
    local repo="$1"

    if [[ "$repo" == "" ]]; then
        echo "Usage: $(basename "$0") [RepoName]"
        exit 1
    fi
    if [[ "$repo" != */* ]]; then
        repo="$defaultuser/$repo"
    fi
    local cmd="git clone https://github.com/$repo.git"
    echo "$cmd"
    eval "$cmd"
    cd "$(basename "$repo")"
}
