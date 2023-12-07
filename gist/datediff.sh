#! /usr/bin/env bash

if [[ $# == 1 ]]; then
	day0=$(date -d now +%Y%m%d)
	day1=$1
fi
if [[ $# == 2 ]]; then
	day0=$1
	day1=$2
fi

echo -n "$day0 - $day1 = "

echo $(( ( $(date -d $day0 +%s) - $(date -d $day1 +%s) ) / (60 * 60 * 24) ))
