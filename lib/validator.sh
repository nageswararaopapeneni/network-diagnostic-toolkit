#!/usr/bin/env bash

set -euo pipefail

require_argument() {

    local value="${1:-}"
    local name="${2:-argument}"

    if [[ -z "$value" ]]; then
        echo "Error: Missing required argument: $name"
        return 1
    fi
}

require_command() {

    local command="${1:-}"

    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: Required command '$command' is not installed."
        return 1
    fi
}

require_interface() {

    local iface="${1:-}"

    require_argument "$iface" "interface"

    if ! ip link show "$iface" >/dev/null 2>&1; then
        echo "Error: Interface '$iface' not found."
        return 1
    fi
}

require_host() {

    local host="${1:-}"

    require_argument "$host" "host"
}

require_url() {

    local url="${1:-}"

    require_argument "$url" "url"

    if [[ ! "$url" =~ ^https?:// ]]; then
        echo "Error: Invalid URL."
        return 1
    fi
}

require_port() {

    local port="${1:-}"

    require_argument "$port" "port"

    if ! [[ "$port" =~ ^[0-9]+$ ]]; then
        echo "Error: Invalid port."
        return 1
    fi

    if (( port < 1 || port > 65535 )); then
        echo "Error: Port must be between 1 and 65535."
        return 1
    fi
}