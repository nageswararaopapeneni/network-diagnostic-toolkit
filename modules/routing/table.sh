#!/usr/bin/env bash

set -euo pipefail

routing_table() {

    print_header
    print_section "Routing Table"

    if command -v ip >/dev/null 2>&1; then
        ip route show
    elif command -v route >/dev/null 2>&1; then
        route -n
    else
        echo "Error: No routing utility found."
        return 1
    fi
}