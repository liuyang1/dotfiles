#! /usr/bin/env bash
usage()
{
    echo "repa.sh [OldString] [NewString]"
}
if [[ "$#" != 2 ]]; then
    usage
fi
OLD="$1"
NEW="$2"
DELEM="/"
sed -i "s/$OLD/$NEW/g" \ `grep $OLD -rl .`
