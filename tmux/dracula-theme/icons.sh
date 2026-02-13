#!/usr/bin/env bash
# Common icon functions for dracula theme scripts

# Load local config
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/../local.conf" ]; then
    source "$SCRIPT_DIR/../local.conf"
fi

# Default to plain if not set
TMUX_ICON_STYLE="${TMUX_ICON_STYLE:-plain}"

# Get icon based on status and style
# Usage: get_icon <name> <status>
# name: vpn, adb, mw, dsk, ada
# status: ok, error
get_icon() {
    local name="$1"
    local status="$2"
    
    case "$TMUX_ICON_STYLE" in
        unicode)
            if [ "$status" = "ok" ]; then
                echo "✓"
            else
                echo "✗"
            fi
            ;;
        emoji)
            case "$name" in
                vpn)
                    [ "$status" = "ok" ] && echo "🔗" || echo "❌"
                    ;;
                adb)
                    [ "$status" = "ok" ] && echo "📱" || echo "📵"
                    ;;
                mw)
                    [ "$status" = "ok" ] && echo "🔑" || echo "🔒"
                    ;;
                dsk)
                    [ "$status" = "ok" ] && echo "☁️" || echo "⛔"
                    ;;
                ada)
                    [ "$status" = "ok" ] && echo "🎫" || echo "❌"
                    ;;
                *)
                    [ "$status" = "ok" ] && echo "✓" || echo "✗"
                    ;;
            esac
            ;;
        plain|*)
            if [ "$status" = "ok" ]; then
                echo "o"
            else
                echo "x"
            fi
            ;;
    esac
}

# Get background color based on status
# Usage: get_bg_color <status>
# status: ok, error
get_bg_color() {
    local status="$1"
    
    if [ "$status" = "ok" ]; then
        echo ""  # Use default color from dracula theme
    else
        echo "dark_gray"  # Dark gray for errors
    fi
}

# Format output with background color
# Usage: format_output <name> <icon> <status>
format_output() {
    local name="$1"
    local icon="$2"
    local status="$3"
    
    local bg=$(get_bg_color "$status")
    if [ -n "$bg" ]; then
        # Output with status marker for dracula to detect
        echo "${name}:${icon}:${bg}"
    else
        echo "${name}:${icon}"
    fi
}
