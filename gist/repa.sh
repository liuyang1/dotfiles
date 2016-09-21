#! /usr/bin/env bash
usage()
{
    echo "repa.sh [OldString] [NewString]"
}
if [[ "$#" != 2 ]]; then
    usage
    exit
fi
OLD="$1"
NEW="$2"
export DELEM="/"
# sed -i "s/$OLD/$NEW/g" `grep $OLD -rl .`
sed -i "s/\b$OLD\b/$NEW/g" `grep $OLD -rl .`
