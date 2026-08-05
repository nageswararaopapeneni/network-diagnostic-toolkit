#!/usr/bin/env bash

set -euo pipefail

show_interface_mtu() {

    local iface="${1:-}"

    if [[ -z "$iface" ]]; then
        echo "Usage: network-tool interfaces mtu <interface>"
        return 1
    fi

    if ! ip link show "$iface" >/dev/null 2>&1; then
        echo "Error: Interface '$iface' does not exist."
        return 1
    fi

    print_header
    print_section "MTU Information"

    ip link show "$iface" | grep mtu
}