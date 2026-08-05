#!/usr/bin/env bash

set -euo pipefail

LOG_DIR="$TOOLKIT_ROOT/logs"
LOG_FILE="$LOG_DIR/toolkit.log"

mkdir -p "$LOG_DIR"

log() {

    printf "[%s] %s\n" \
        "$(date '+%F %T')" \
        "$1" >> "$LOG_FILE"
}