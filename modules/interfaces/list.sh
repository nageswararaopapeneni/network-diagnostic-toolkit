#!/usr/bin/env bash

set -euo pipefail

show_interfaces_list() {

    print_header

    print_section "Network Interfaces"

    ip -brief link
}