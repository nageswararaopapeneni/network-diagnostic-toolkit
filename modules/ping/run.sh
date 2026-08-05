#!/usr/bin/env bash

set -euo pipefail

ping_run() {

    local host="${1:-}"

    if [[ -z "$host" ]]; then
        echo "Usage: network-tool ping run <host>"
        return 1
    fi

    if ! command -v ping >/dev/null 2>&1; then
        echo "Error: ping command not found."
        return 1
    fi

    print_header
    print_section "Ping Test"

    echo "Host : $host"
    echo

    ping -c 4 "$host"
}