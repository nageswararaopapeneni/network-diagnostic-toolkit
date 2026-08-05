#!/usr/bin/env bash

set -euo pipefail

dns_reverse() {

    local ip="${1:-}"

    if [[ -z "$ip" ]]; then
        echo "Usage: network-tool dns reverse <ip-address>"
        return 1
    fi

    print_header
    print_section "Reverse DNS Lookup"

    if command -v dig >/dev/null 2>&1; then
        dig +short -x "$ip"

    elif command -v host >/dev/null 2>&1; then
        host "$ip"

    elif command -v nslookup >/dev/null 2>&1; then
        nslookup "$ip"

    else
        echo "No reverse DNS utility found."
        echo "Install package: dnsutils"
        return 1
    fi
}