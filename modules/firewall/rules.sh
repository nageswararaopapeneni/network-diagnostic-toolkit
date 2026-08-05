#!/usr/bin/env bash

set -euo pipefail

firewall_rules() {

    print_header
    print_section "Firewall Rules"

    if command -v ufw >/dev/null 2>&1; then

        echo "Firewall Manager : UFW"
        echo

        if [[ $EUID -eq 0 ]]; then
            ufw status numbered
        else
            sudo ufw status numbered
        fi

        return
    fi

    if command -v nft >/dev/null 2>&1; then

        echo "Firewall Manager : nftables"
        echo

        sudo nft list ruleset
        return
    fi

    if command -v iptables >/dev/null 2>&1; then

        echo "Firewall Manager : iptables"
        echo

        sudo iptables -L -n -v
        return
    fi

    echo "No supported firewall manager found."
}