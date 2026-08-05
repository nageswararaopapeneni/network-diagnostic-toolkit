#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/list.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/info.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/stats.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/mtu.sh"

interfaces() {

    local command="${1:-}"
    shift || true

    case "$command" in
        list)
            show_interfaces_list
            ;;

        info)
            show_interface_info "$@"
            ;;

        stats)
            show_interface_stats "$@"
            ;;

        mtu)
            show_interface_mtu "$@"
            ;;

        *)
            echo "Unknown interfaces command: $command"
            echo
            echo "Usage:"
            echo "  network-tool interfaces list"
            echo "  network-tool interfaces info <interface>"
            echo "  network-tool interfaces stats <interface>"
            echo "  network-tool interfaces mtu <interface>"
            return 1
            ;;
    esac
}