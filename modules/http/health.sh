#!/usr/bin/env bash

set -euo pipefail

http_health() {

    local url="${1:-}"

    if [[ -z "$url" ]]; then
        echo "Usage: network-tool http health <url>"
        return 1
    fi

    print_header
    print_section "HTTP Health"

    local status
    local latency

    status="$(curl \
        --silent \
        --output /dev/null \
        --write-out "%{http_code}" \
        "$url")"

    latency="$(curl \
        --silent \
        --output /dev/null \
        --write-out "%{time_total}" \
        "$url")"

    printf "%-15s %s\n" "URL:" "$url"
    printf "%-15s %s\n" "HTTP Status:" "$status"
    printf "%-15s %ss\n" "Latency:" "$latency"

    if [[ "$status" =~ ^2|3 ]]; then
        printf "%-15s %s\n" "Health:" "HEALTHY"
    else
        printf "%-15s %s\n" "Health:" "UNHEALTHY"
    fi
}