#!/usr/bin/env bash

set -euo pipefail

ssl_info() {

    local host="${1:-}"

    if [[ -z "$host" ]]; then
        echo "Usage: network-tool ssl info <host>"
        return 1
    fi

    print_header
    print_section "SSL Certificate"

    openssl s_client \
        -connect "${host}:443" \
        -servername "$host" \
        </dev/null 2>/dev/null |
        openssl x509 -noout -subject -issuer -dates
}