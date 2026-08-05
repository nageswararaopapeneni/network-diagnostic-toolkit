#!/usr/bin/env bash

set -euo pipefail

firewall_ufw() {

    print_header
    print_section "UFW Information"

    if ! command -v ufw >/dev/null 2>&1; then
        echo "UFW is not installed."
        return 1
    fi

    if [[ $EUID -eq 0 ]]; then
        ufw status verbose
    else
        sudo ufw status verbose
    fi
}