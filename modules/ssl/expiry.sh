#!/usr/bin/env bash

set -euo pipefail

ssl_expiry() {

    local host="${1:-}"

    if [[ -z "$host" ]]; then
        echo "Usage: network-tool ssl expiry <host>"
        return 1
    fi

    print_header
    print_section "Certificate Expiry"

    openssl s_client \
        -connect "${host}:443" \
        -servername "$host" \
        </dev/null 2>/dev/null |
        openssl x509 -noout -enddate
}