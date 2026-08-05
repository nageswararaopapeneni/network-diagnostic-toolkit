#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/info.sh"
source "$SCRIPT_DIR/expiry.sh"
source "$SCRIPT_DIR/issuer.sh"
source "$SCRIPT_DIR/protocols.sh"

ssl() {

    local command="${1:-}"
    shift || true

    case "$command" in

        info)
            ssl_info "$@"
            ;;

        expiry)
            ssl_expiry "$@"
            ;;

        issuer)
            ssl_issuer "$@"
            ;;

        protocols)
            ssl_protocols "$@"
            ;;

        *)
            echo "Unknown ssl command: $command"
            echo
            echo "Usage:"
            echo "  network-tool ssl info <host>"
            echo "  network-tool ssl expiry <host>"
            echo "  network-tool ssl issuer <host>"
            echo "  network-tool ssl protocols <host>"
            return 1
            ;;
    esac
}