#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/icons.sh"

check_dsk() {
    cert_file=~/.ssh/id_ecdsa-cert.pub
    
    # 首先检查文件是否存在
    if [ ! -f "$cert_file" ]; then
        format_output "dsk" "$(get_icon dsk error)" "error"
        return 1
    fi

    # 获取证书信息
    cert_info=$(ssh-keygen -L -f "$cert_file" 2>/dev/null)
    if [ $? -ne 0 ]; then
        format_output "dsk" "$(get_icon dsk error)" "error"
        return 1
    fi

    # 提取有效期信息
    valid_line=$(echo "$cert_info" | grep "Valid:")
    if [ -z "$valid_line" ]; then
        format_output "dsk" "$(get_icon dsk error)" "error"
        return 1
    fi

    # 提取结束时间
    end_time=$(echo "$valid_line" | sed 's/.*to \([0-9-]*T[0-9:]*\).*/\1/')
    if [ -z "$end_time" ] || [ "$end_time" = "$valid_line" ]; then
        format_output "dsk" "$(get_icon dsk error)" "error"
        return 1
    fi

    # 转换时间格式为时间戳 (macOS compatible)
    if date --version >/dev/null 2>&1; then
        # GNU date (Linux)
        end_timestamp=$(date -d "$end_time" +%s 2>/dev/null)
    else
        # BSD date (macOS)
        end_timestamp=$(date -j -f "%Y-%m-%dT%H:%M:%S" "$end_time" +%s 2>/dev/null)
    fi
    current_timestamp=$(date +%s)

    # 比较时间
    if [ $current_timestamp -lt $end_timestamp ]; then
        format_output "dsk" "$(get_icon dsk ok)" "ok"
    else
        format_output "dsk" "$(get_icon dsk error)" "error"
    fi
}

check_dsk
