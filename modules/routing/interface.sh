#!/usr/bin/env bash

set -euo pipefail

routing_interface() {

    print_header
    print_section "Default Route Interface"

    if ! command -v ip >/dev/null 2>&1; then
        echo "Error: ip command not found."
        return 1
    fi

    local interface

    interface="$(ip route | awk '/^default/ {print $5}')"

    if [[ -z "$interface" ]]; then
        echo "No active interface found."
        return 1
    fi

    printf "%-12s %s\n" "Interface:" "$interface"

    echo
    ip addr show "$interface"
}