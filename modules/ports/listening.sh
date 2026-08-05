#!/usr/bin/env bash

set -euo pipefail

ports_listening() {

    print_header
    print_section "Listening TCP/UDP Ports"

    if command -v ss >/dev/null 2>&1; then
        ss -tuln
    elif command -v netstat >/dev/null 2>&1; then
        netstat -tuln
    else
        echo "Error: Neither 'ss' nor 'netstat' is installed."
        return 1
    fi
}