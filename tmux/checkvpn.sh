check_vpn() {
    if ifconfig | grep -q "tun0"; then
        echo "#[fg=green]VPN:Wired#[default]"
    else
        echo "#[fg=red]VPN:Broken#[default]"
    fi
}
check_vpn
