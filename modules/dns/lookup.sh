#!/usr/bin/env bash

set -euo pipefail

dns_lookup() {

    local domain="${1:-}"

    if [[ -z "$domain" ]]; then
        echo "Usage: network-tool dns lookup <domain>"
        return 1
    fi

    print_header
    print_section "DNS Lookup"

    if command -v dig >/dev/null 2>&1; then
        dig +short "$domain"
    elif command -v nslookup >/dev/null 2>&1; then
        nslookup "$domain"
    elif command -v host >/dev/null 2>&1; then
        host "$domain"
    else
        echo "No DNS lookup tool found."
        echo "Install one of: dnsutils"
        return 1
    fi
}