#!/usr/bin/env bash

set -euo pipefail

http_timing() {

    local url="${1:-}"

    if [[ -z "$url" ]]; then
        echo "Usage: network-tool http timing <url>"
        return 1
    fi

    print_header
    print_section "HTTP Timing"

    curl \
        --silent \
        --output /dev/null \
        --write-out \
"DNS Lookup      : %{time_namelookup}s
TCP Connect     : %{time_connect}s
TLS Handshake   : %{time_appconnect}s
First Byte      : %{time_starttransfer}s
Total Time      : %{time_total}s
" \
        "$url"
}