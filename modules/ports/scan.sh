#!/usr/bin/env bash

set -euo pipefail

ports_scan() {

    local host="${1:-}"

    if [[ -z "$host" ]]; then
        echo "Usage: network-tool ports scan <host>"
        return 1
    fi

    local ports=(22 80 443 3306 5432 6379 8080)

    print_header
    print_section "Common Port Scan"

    printf "%-10s %-10s\n" "PORT" "STATUS"
    printf "%-10s %-10s\n" "----------" "----------"

    for port in "${ports[@]}"; do

        if timeout 2 bash -c "</dev/tcp/$host/$port" 2>/dev/null; then
            printf "%-10s %-10s\n" "$port" "OPEN"
        else
            printf "%-10s %-10s\n" "$port" "CLOSED"
        fi

    done
}