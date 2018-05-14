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

awk "$begin <= NR && NR <= $end {print NR\":\",\$0}" "$filename" > "$begin-$end.$filename"
