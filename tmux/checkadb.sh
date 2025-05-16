#!/bin/bash

check_adb() {
    # 执行adb devices并获取第一个设备（跳过第一行的"List of devices attached"）
    device=$(adb devices | sed -n '2p' | awk '{print $1}')
    
    if [ -z "$device" ]; then
        echo "#[fg=red]adb:[NA]#[default]"
    else
        # 检查设备名长度
        if [ ${#device} -gt 10 ]; then
            # 取前4个和后4个字符
            shortened="${device:0:4}..${device: -4}"
            echo "#[fg=green]adb:$shortened#[default]"
        else
            # 直接显示完整设备名
            echo "#[fg=green]adb:$device#[default]"
        fi
    fi
}

check_adb
