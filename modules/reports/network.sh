#!/usr/bin/env bash

set -euo pipefail

reports_network() {

    print_header
    print_section "Network Summary"

    ip -brief addr

    echo

    ip route
}