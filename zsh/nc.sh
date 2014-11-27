#! /usr/bin/env bash
# NOTE:
# NOT suport default shell dash
# echo -n "testcontent" > /dev/tcp/127.0.0.1/7211

# echo -n "testcontent2" | nc 127.0.0.1 7211
d="/home/liuyang/gtv/vendor/marvell-sdk/ampsdk/amp"
method="get"
cmd="$method $d"

ret=$(echo -n "$cmd" | nc 127.0.0.1 7211)
echo "$ret"
