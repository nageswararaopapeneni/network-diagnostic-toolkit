#!/usr/bin/env bash

set -euo pipefail

connections_tcp() {

    print_header
    print_section "TCP Connections"

    if command -v ss >/dev/null 2>&1; then
        ss -tan
    elif command -v netstat >/dev/null 2>&1; then
        netstat -tan
    else
        echo "Neither 'ss' nor 'netstat' is installed."
        return 1
    fi
}