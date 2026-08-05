#!/usr/bin/env bash

set -euo pipefail

show_interface_info() {

    local iface="${1:-}"

    if [[ -z "$iface" ]]; then
        echo "Usage: network-tool interfaces info <interface>"
        return 1
    fi

    print_header
    print_section "Interface Information"

    ip addr show "$iface"
}