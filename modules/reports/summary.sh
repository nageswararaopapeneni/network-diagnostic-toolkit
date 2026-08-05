#!/usr/bin/env bash

set -euo pipefail

reports_summary() {

    print_header
    print_section "System Summary"

    echo "Hostname : $(hostname)"
    echo "Kernel   : $(uname -r)"
    echo "OS       : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "Uptime   : $(uptime -p)"
    echo "User     : $(whoami)"
}