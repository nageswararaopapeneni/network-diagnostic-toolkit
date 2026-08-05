#!/usr/bin/env bash

set -euo pipefail

http_headers() {

    local url="${1:-}"

    if [[ -z "$url" ]]; then
        echo "Usage: network-tool http headers <url>"
        return 1
    fi

    print_header
    print_section "HTTP Headers"

    curl -I --silent "$url"
}