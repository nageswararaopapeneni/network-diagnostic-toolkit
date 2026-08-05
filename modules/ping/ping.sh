#!/usr/bin/env bash

set -euo pipefail

source "$TOOLKIT_ROOT/lib/common.sh"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=/dev/null
source "$SCRIPT_DIR/run.sh"

ping_module() {

    local command="${1:-}"

    shift || true

    case "$command" in

        run)
            ping_run "$@"
            ;;

        *)
            echo "Unknown ping command: $command"
            echo
            echo "Usage:"
            echo "  network-tool ping run <host>"
            return 1
            ;;
    esac
}