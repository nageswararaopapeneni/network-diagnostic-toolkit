#!/usr/bin/env bash

set -euo pipefail

readonly TOOLKIT_NAME="Network Diagnostic Toolkit"

get_project_root() {
    local script_dir

    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    cd "$script_dir/.." && pwd
}

get_version() {
    cat "$(get_project_root)/VERSION"
}

print_header() {
    printf "\n"
    printf "==================================================\n"
    printf " %s v%s\n" "$TOOLKIT_NAME" "$(get_version)"
    printf "==================================================\n\n"
}

print_section() {
    printf "%s\n" "$1"
    printf "%s\n" "--------------------------------------------------"
}