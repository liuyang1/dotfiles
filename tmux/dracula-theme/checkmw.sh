#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/icons.sh"

check_mw() {
    # 执行mwinit -l并捕获输出
    output=$(mwinit -l 2>&1)
    
    # 检查命令是否成功执行且输出包含"cert"
    if [ $? -eq 0 ] && echo "$output" | grep -q "cert"; then
        format_output "mw" "$(get_icon mw ok)" "ok"
    else
        format_output "mw" "$(get_icon mw error)" "error"
    fi
}

check_mw
