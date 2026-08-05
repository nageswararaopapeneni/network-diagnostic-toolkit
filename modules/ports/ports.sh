#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/listening.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/check.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/scan.sh"

ports() {

    local command="${1:-}"
    shift || true

    case "$command" in
        listening)
            ports_listening
            ;;

        check)
            ports_check "$@"
            ;;

        scan)
            ports_scan "$@"
            ;;

        *)
            echo "Unknown ports command: $command"
            echo
            echo "Usage:"
            echo "  network-tool ports listening"
            echo "  network-tool ports check <host> <port>"
            echo "  network-tool ports scan <host>"
            return 1
            ;;
    esac
}