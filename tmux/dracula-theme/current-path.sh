#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOCAL_CONF="$HOME/.tmux/local.conf"

# Get current pane path
current_path=$(tmux display-message -p -F "#{pane_current_path}")

# Read config from local.conf
if [ -f "$LOCAL_CONF" ]; then
    export TMUX_PATH_STYLE=$(grep '@dracula-path-style' "$LOCAL_CONF" | sed 's/.*"\(.*\)".*/\1/')
    export TMUX_PATH_MARKERS=$(grep '@dracula-path-markers' "$LOCAL_CONF" | sed 's/.*"\(.*\)".*/\1/')
fi

# Defaults
: ${TMUX_PATH_STYLE:="basename"}
: ${TMUX_PATH_MARKERS:=".git"}

# Call Lua script
"${CURRENT_DIR}/current-path.lua" "$current_path"
