#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/active.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/tcp.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/udp.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/established.sh"

connections() {

    local command="${1:-}"
    shift || true

    case "$command" in

        active)
            connections_active
            ;;

        tcp)
            connections_tcp
            ;;

        udp)
            connections_udp
            ;;

        established)
            connections_established
            ;;

        *)
            echo "Unknown connections command: $command"
            echo
            echo "Usage:"
            echo "  network-tool connections active"
            echo "  network-tool connections tcp"
            echo "  network-tool connections udp"
            echo "  network-tool connections established"
            return 1
            ;;
    esac
}