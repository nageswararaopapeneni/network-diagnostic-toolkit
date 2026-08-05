#!/usr/bin/env bash

set -euo pipefail

show_interface_stats() {

    local iface="${1:-}"

    if [[ -z "$iface" ]]; then
        echo "Usage: network-tool interfaces stats <interface>"
        return 1
    fi

    if ! ip link show "$iface" >/dev/null 2>&1; then
        echo "Error: Interface '$iface' does not exist."
        return 1
    fi

    print_header
    print_section "Interface Statistics"

    ip -s link show "$iface"
}