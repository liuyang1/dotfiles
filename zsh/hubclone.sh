#! /usr/bin/env bash
function hub()
{
    if [[ "$1" == "" ]]; then
        echo "usage: hub [author/]reponame"
        echo "       auto git clone from github, and switch to it"
        return
    fi
    local defaultuser="liuyang1"
    local repo="$1"

    if [[ "$repo" != */* ]]; then
        repo="$defaultuser/$repo"
    fi
    local cmd="git clone https://github.com/$repo.git"
    echo "$cmd"
    eval "$cmd"
    cd "$(basename "$repo")"
}
