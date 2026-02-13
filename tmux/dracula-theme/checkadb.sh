#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/icons.sh"

check_adb() {
    devices=($(adb devices | tail -n +2 | awk '$2=="device" {print $1}'))
    count=${#devices[@]}
    
    if [ $count -eq 0 ]; then
        format_output "adb" "$(get_icon adb error)" "error"
    elif [ $count -eq 1 ]; then
        device="${devices[0]}"
        product=$(echo 'echo $PRODUCT_NAME' | adb -s "$device" shell 2>/dev/null | tr -d '\r')
        [ -z "$product" ] && product="unknown"
        
        if [ ${#device} -gt 10 ]; then
            device="${device:0:4}..${device: -4}"
        fi
        format_output "adb" "$product/$device" "ok"
    else
        idx=$(($(date +%s) / 3 % count))
        device="${devices[$idx]}"
        product=$(echo 'echo $PRODUCT_NAME' | adb -s "$device" shell 2>/dev/null | tr -d '\r')
        [ -z "$product" ] && product="unknown"
        
        if [ ${#device} -gt 10 ]; then
            device="${device:0:4}..${device: -4}"
        fi
        format_output "adb" "$product/$device[$((idx+1))/$count]" "ok"
    fi
}

check_adb
