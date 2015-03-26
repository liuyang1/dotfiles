#! /usr/bin/env bash
usage()
{
    echo "$(basename "$0") [matchName] [path=gitroot/.]"
}
if [[ "$#" == 1 ]]; then
    d="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [[ "$?" != 0 ]]; then
        d="."
    else
        echo "git root=$d"
    fi
elif [[ "$#" == 2 ]]; then
    d="$2"
else
    usage
    exit 1
fi
find "$d" -type f -name "*$1*"
find "$d" -type d -name "*$1*"
