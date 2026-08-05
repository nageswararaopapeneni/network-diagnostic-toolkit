#!/usr/bin/env bash

set -euo pipefail

routing_gateway() {

    print_header
    print_section "Default Gateway"

    if ! command -v ip >/dev/null 2>&1; then
        echo "Error: ip command not found."
        return 1
    fi

    local gateway
    local interface

    gateway="$(ip route | awk '/^default/ {print $3}')"
    interface="$(ip route | awk '/^default/ {print $5}')"

    if [[ -z "$gateway" ]]; then
        echo "No default gateway configured."
        return 1
    fi

    printf "%-12s %s\n" "Gateway:" "$gateway"
    printf "%-12s %s\n" "Interface:" "$interface"
}