#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/lookup.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/reverse.sh"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/servers.sh"

dns() {

    local command="${1:-}"
    shift || true

    case "$command" in
        lookup)
            dns_lookup "$@"
            ;;

        reverse)
            dns_reverse "$@"
            ;;

        servers)
            dns_servers
            ;;

        *)
            echo "Unknown dns command: $command"
            echo
            echo "Usage:"
            echo "  network-tool dns lookup <domain>"
            echo "  network-tool dns reverse <ip-address>"
            echo "  network-tool dns servers"
            return 1
            ;;
    esac
}