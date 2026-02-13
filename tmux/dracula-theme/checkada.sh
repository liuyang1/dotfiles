#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/icons.sh"

check_ada() {
    # 尝试执行 aws sts get-caller-identity 并捕获输出
    output=$(aws sts get-caller-identity 2>&1)
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        format_output "ada" "$(get_icon ada ok)" "ok"
    else
        format_output "ada" "$(get_icon ada error)" "error"
    fi
}

check_ada
