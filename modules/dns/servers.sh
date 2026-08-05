#!/usr/bin/env bash

set -euo pipefail

dns_servers() {

    print_header
    print_section "Configured DNS Servers"

    if [[ ! -f /etc/resolv.conf ]]; then
        echo "Unable to locate /etc/resolv.conf"
        return 1
    fi

    local found=false

    while read -r line; do

        case "$line" in

            nameserver*)
                found=true
                printf "DNS Server : %s\n" "${line#nameserver }"
                ;;

            search*)
                printf "Search     : %s\n" "${line#search }"
                ;;

            domain*)
                printf "Domain     : %s\n" "${line#domain }"
                ;;

        esac

    done < /etc/resolv.conf

    if [[ "$found" == false ]]; then
        echo "No DNS servers configured."
    fi
}