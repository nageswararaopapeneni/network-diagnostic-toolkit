#!/usr/bin/env bash

set -euo pipefail

ports_check() {

    local host="${1:-}"
    local port="${2:-}"

    if [[ -z "$host" || -z "$port" ]]; then
        echo "Usage: network-tool ports check <host> <port>"
        return 1
    fi

    print_header
    print_section "Port Connectivity Check"

    echo "Host : $host"
    echo "Port : $port"
    echo

    if timeout 5 bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
        echo "Status : OPEN"
    else
        echo "Status : CLOSED or UNREACHABLE"
    fi
}