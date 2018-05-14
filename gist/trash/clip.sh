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

head -n "$end" "$filename" | tail -n (($end - $begin)) > "$begin_$end.$filename"
