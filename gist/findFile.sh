#! /usr/bin/env bash
d="$(git rev-parse --show-toplevel 2>/dev/null)"
if [[ "$?" != 0 ]]; then
    d="."
else
    echo "git root=$d"
fi
find "$d" -type f -name "*$1*"
find "$d" -type d -name "*$1*"
