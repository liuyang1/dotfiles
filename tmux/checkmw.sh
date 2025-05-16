#!/bin/bash

check_mw() {
    # 执行mwinit -l并捕获输出
    output=$(mwinit -l 2>&1)
    
    # 检查命令是否成功执行且输出包含"cert"
    if [ $? -eq 0 ] && echo "$output" | grep -q "cert"; then
        echo "#[fg=green]midway:Cert#[default]"
    else
        echo "#[bg=red]midway:EXPIRED#[default]"
    fi
}

check_mw
