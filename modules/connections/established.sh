#!/usr/bin/env bash

set -euo pipefail

connections_established() {

    print_header
    print_section "Established TCP Connections"

    if command -v ss >/dev/null 2>&1; then
        ss -tan state established
    elif command -v netstat >/dev/null 2>&1; then
        netstat -tan | grep ESTABLISHED
    else
        echo "Neither 'ss' nor 'netstat' is installed."
        return 1
    fi
}