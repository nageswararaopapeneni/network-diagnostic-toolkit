#!/usr/bin/env bash

set -euo pipefail

connections_udp() {

    print_header
    print_section "UDP Connections"

    if command -v ss >/dev/null 2>&1; then
        ss -uan
    elif command -v netstat >/dev/null 2>&1; then
        netstat -uan
    else
        echo "Neither 'ss' nor 'netstat' is installed."
        return 1
    fi
}