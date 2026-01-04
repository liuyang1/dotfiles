#!/bin/bash

check_dsk() {
    cert_file=~/.ssh/id_ecdsa-cert.pub
    
    # 首先检查文件是否存在
    if [ ! -f "$cert_file" ]; then
        echo "#[bg=red]dsk:NO_CERT#[default]"
        return 1
    fi

    # 获取证书信息
    cert_info=$(ssh-keygen -L -f "$cert_file" 2>/dev/null)
    if [ $? -ne 0 ]; then
        echo "#[bg=red]dsk:INVALID#[default]"
        return 1
    fi

    # 提取有效期信息
    valid_line=$(echo "$cert_info" | grep "Valid:")
    if [ -z "$valid_line" ]; then
        echo "#[bg=red]dsk:NO_VALID_INFO#[default]"
        return 1
    fi

    # 提取结束时间
    end_time=$(echo "$valid_line" | sed 's/.*to \([0-9-]*T[0-9:]*\).*/\1/')
    if [ -z "$end_time" ] || [ "$end_time" = "$valid_line" ]; then
        echo "#[bg=red]dsk:PARSE_ERROR#[default]"
        return 1
    fi

    # 转换时间格式为时间戳
    end_timestamp=$(date -d "$end_time" +%s 2>/dev/null)
    current_timestamp=$(date +%s)

    # 比较时间
    if [ $current_timestamp -lt $end_timestamp ]; then
        echo "#[fg=green]dsk:Cert#[default]"
    else
        echo "#[bg=red]dsk:EXPIRED#[default]"
    fi
}

check_dsk
