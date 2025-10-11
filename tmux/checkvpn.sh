# updat eto use utun4 to check openvpn client
check_vpn() {
    if ifconfig | grep -q "utun4"; then
        echo "#[fg=green]VPN:Wired#[default]"
    else
        echo "#[fg=red]VPN:Broken#[default]"
    fi
}
check_vpn
