#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/table.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/gateway.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/interface.sh"

routing() {

    local command="${1:-}"
    shift || true

    case "$command" in
        table)
            routing_table
            ;;

        gateway)
            routing_gateway
            ;;

        interface)
            routing_interface
            ;;

        *)
            echo "Unknown routing command: $command"
            echo
            echo "Usage:"
            echo "  network-tool routing table"
            echo "  network-tool routing gateway"
            echo "  network-tool routing interface"
            return 1
            ;;
    esac
}