#! /usr/bin/env bash
repopath="$1"
repo="$(basename "$repopath")"

git remote add "$repo" "$repopath"
git fetch "$repo"
git checkout -b "$repo" "$repo"/master
git checkout master
git merge "$repo"
git remote rm "$repo"
