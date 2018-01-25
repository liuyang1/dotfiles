#! /usr/bin/env bash

usage() {
    echo "$0 [filename] [begin] [end]"
}

filename="$1"
begin="$2"
end="$3"
if [[ "$begin" == "" || "$end" == "" ]]; then
    usage
    exit
fi

bline=`grep -n "$begin" "$filename" | head -n 1 | cut -d : -f 1`
eline=`grep -n "$end" "$filename" | tail -n 1 | cut -d : -f 1`
echo "$begin - $end => $bline - $eline => $bline-$eline.$filename"

head -n "$eline" "$filename" | tail -n $(($eline - $bline)) > "$bline-$eline.$filename"
