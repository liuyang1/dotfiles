#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

check_adb()
{
    # 执行adb devices并获取第一个设备（跳过第一行的"List of devices attached"）
    device=$(adb devices | sed -n '2p' | awk '{print $1}')
    
    if [ -z "$device" ]; then
        #echo "#[bg=red,fg=black]adb:[NA]#[default]"
        IFS=' ' read -r -a colors <<< "red dark_gray"
        echo "adb:[NA]"
    else
        # 检查设备名长度
        IFS=' ' read -r -a colors <<< "green dark_gray"
        if [ ${#device} -gt 10 ]; then
            # 取前4个和后4个字符
            shortened="${device:0:4}..${device: -4}"
            # echo "#[fg=green]adb:$shortened#[default]"
            echo "adb:$shortened"
        else
            # 直接显示完整设备名
            # echo "#[fg=green]adb:$device#[default]"
            echo "#[fg=green]adb:$device#[default]"
        fi
    fi
}

check_adb
