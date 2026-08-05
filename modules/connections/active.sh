#!/usr/bin/env bash

set -euo pipefail

connections_active() {

    print_header
    print_section "Active Network Connections"

    if command -v ss >/dev/null 2>&1; then
        ss -tunap
    elif command -v netstat >/dev/null 2>&1; then
        netstat -tunap
    else
        echo "Neither 'ss' nor 'netstat' is available."
        return 1
    fi
}