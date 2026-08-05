#!/usr/bin/env bash

set -euo pipefail

ssl_protocols() {

    local host="${1:-}"

    if [[ -z "$host" ]]; then
        echo "Usage: network-tool ssl protocols <host>"
        return 1
    fi

    print_header
    print_section "TLS Connection Details"

    local output

    output="$(openssl s_client \
        -connect "${host}:443" \
        -servername "$host" \
        </dev/null 2>/dev/null)"

    echo "$output" | grep "^New,"
    echo "$output" | grep "^Verification:"
    echo "$output" | grep "^Verify return code:"
}