#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/status.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/rules.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/ufw.sh"

firewall() {

    local command="${1:-}"
    shift || true

    case "$command" in

        status)
            firewall_status
            ;;

        rules)
            firewall_rules
            ;;

        ufw)
            firewall_ufw
            ;;

        *)
            echo "Unknown firewall command: $command"
            echo
            echo "Usage:"
            echo "  network-tool firewall status"
            echo "  network-tool firewall rules"
            echo "  network-tool firewall ufw"
            return 1
            ;;
    esac
}