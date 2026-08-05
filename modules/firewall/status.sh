#!/usr/bin/env bash

set -euo pipefail

firewall_status() {

    print_header
    print_section "Firewall Status"

    if command -v ufw >/dev/null 2>&1; then
        echo "Firewall Manager : UFW"
        echo

        if [[ $EUID -eq 0 ]]; then
            ufw status verbose
        else
            sudo ufw status verbose
        fi

        return
    fi

    if command -v firewall-cmd >/dev/null 2>&1; then
        echo "Firewall Manager : firewalld"
        firewall-cmd --state
        return
    fi

    if command -v nft >/dev/null 2>&1; then
        echo "Firewall Manager : nftables"
        nft list ruleset
        return
    fi

    if command -v iptables >/dev/null 2>&1; then
        echo "Firewall Manager : iptables"
        iptables -L -n
        return
    fi

    echo "No supported firewall manager found."
}