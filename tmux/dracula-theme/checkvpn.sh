#!/usr/bin/env bash
# Check VPN connection status

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/icons.sh"

check_vpn() {
    # Check Cisco Secure Client status (primary method)
    if command -v /opt/cisco/secureclient/bin/vpn >/dev/null 2>&1; then
        vpn_state=$(/opt/cisco/secureclient/bin/vpn state 2>&1 | grep "state:" | tail -1)
        # Check for "Connected" but not "Disconnected"
        if echo "$vpn_state" | grep -q "state: Connected"; then
            format_output "VPN" "$(get_icon vpn ok)" "ok"
        else
            format_output "VPN" "$(get_icon vpn error)" "error"
        fi
        return
    fi
    
    # Fallback: Check for VPN interfaces with IP addresses (for non-Cisco VPN)
    # Common VPN networks: 10.x, 11.x (Amazon), 172.16-31.x, 192.168.x
    if ifconfig | grep -A 2 "utun" | grep -q "inet 10\.\|inet 11\.\|inet 172\.\(1[6-9]\|2[0-9]\|3[0-1]\)\.\|inet 192\.168\."; then
        format_output "VPN" "$(get_icon vpn ok)" "ok"
    else
        format_output "VPN" "$(get_icon vpn error)" "error"
    fi
}

check_vpn
