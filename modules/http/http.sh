#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/status.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/headers.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/timing.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/health.sh"

http() {

    local command="${1:-}"
    shift || true

    case "$command" in
        status)
            http_status "$@"
            ;;

        headers)
            http_headers "$@"
            ;;

        timing)
            http_timing "$@"
            ;;

        health)
            http_health "$@"
            ;;

        *)
            echo "Unknown HTTP command: $command"
            echo
            echo "Usage:"
            echo "  network-tool http status <url>"
            echo "  network-tool http headers <url>"
            echo "  network-tool http timing <url>"
            echo "  network-tool http health <url>"
            return 1
            ;;
    esac
}