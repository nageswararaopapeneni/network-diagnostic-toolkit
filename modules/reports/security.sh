#!/usr/bin/env bash

set -euo pipefail

reports_security() {

    print_header
    print_section "Security Summary"

    if command -v ufw >/dev/null 2>&1; then

        echo "Firewall"

        sudo ufw status

        echo

    fi

    echo "Open Listening Ports"

    ss -tuln
}