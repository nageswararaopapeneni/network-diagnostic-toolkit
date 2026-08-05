#!/usr/bin/env bash

set -euo pipefail

reports_full() {

    local report="network-report-$(date +%Y%m%d-%H%M%S).txt"

    {

        echo "=============================================="
        echo " Network Diagnostic Toolkit Report"
        echo "=============================================="

        echo
        echo "Generated:"
        date

        echo
        echo "Hostname:"
        hostname

        echo
        echo "Interfaces:"
        ip -brief addr

        echo
        echo "Routing:"
        ip route

        echo
        echo "Listening Ports:"
        ss -tuln

        echo
        echo "Firewall:"
        if command -v ufw >/dev/null 2>&1; then
            sudo ufw status
        fi

    } > "$report"

    print_header
    print_section "Report Generated"

    echo "Saved to:"
    echo
    echo "$PWD/$report"
}