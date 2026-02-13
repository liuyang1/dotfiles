#!/bin/bash

check_ada() {
    # 尝试执行 aws sts get-caller-identity 并捕获输出
    output=$(aws sts get-caller-identity 2>&1)
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        # 如果命令成功执行，显示绿色的状态
        #echo "#[fg=green]ada:Valid#[default]"
        echo "ada:Valid"
    else
        # 如果命令失败，显示红色的状态
        #echo "#[bg=red,fg=black]ada:Invalid#[default]"
        echo "ada:Invalid"
    fi
}

check_ada
