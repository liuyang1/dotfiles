#! /usr/bin/env bash
# NOTE:
# NOT suport default shell dash
# echo -n "testcontent" > /dev/tcp/127.0.0.1/7211

# echo -n "testcontent2" | nc 127.0.0.1 7211
method="get"
cmd="$method $d"

ret=$(echo -n "$cmd" | nc 127.0.0.1 7211)
echo "$ret"
