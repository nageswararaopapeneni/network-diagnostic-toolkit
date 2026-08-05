#!/usr/bin/env bash

set -euo pipefail

http_status() {

    local url="${1:-}"

    if [[ -z "$url" ]]; then
        echo "Usage: network-tool http status <url>"
        return 1
    fi

    if ! command -v curl >/dev/null 2>&1; then
        echo "Error: curl is not installed."
        return 1
    fi

    print_header
    print_section "HTTP Status"

    local status

    status="$(curl \
        --silent \
        --output /dev/null \
        --write-out "%{http_code}" \
        "$url")"

    printf "%-15s %s\n" "URL:" "$url"
    printf "%-15s %s\n" "Status Code:" "$status"
}