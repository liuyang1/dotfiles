# updat eto use utun4 to check openvpn client
check_vpn() {
    if ifconfig | grep -q "utun4"; then
        # echo "#[fg=green]VPN:Wired#[default]"
        # echo "VPN:Wired"
        echo "VPN:--"
    else
        # echo "#[fg=red]VPN:Broken#[default]"
        # echo "VPN:Broken"
        echo "VPN:!!"
    fi
}
check_vpn
