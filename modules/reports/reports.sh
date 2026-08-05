#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/summary.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/network.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/security.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/full.sh"

reports() {

    local command="${1:-}"
    shift || true

    case "$command" in

        summary)
            reports_summary
            ;;

        network)
            reports_network
            ;;

        security)
            reports_security
            ;;

        full)
            reports_full
            ;;

        *)
            echo "Unknown reports command: $command"
            echo
            echo "Usage:"
            echo "  network-tool reports summary"
            echo "  network-tool reports network"
            echo "  network-tool reports security"
            echo "  network-tool reports full"
            return 1
            ;;
    esac
}