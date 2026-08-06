#!/usr/bin/env bash

set -euo pipefail

echo "========================================"
echo " Network Diagnostic Toolkit Test Suite"
echo "========================================"

pass() {
    echo "✓ $1"
}

echo
echo "Testing version..."
./bin/network-tool --version >/dev/null
pass "Version"

echo
echo "Testing help..."
./bin/network-tool --help >/dev/null
pass "Help"

echo
echo "Testing interfaces..."
./bin/network-tool interfaces list >/dev/null
pass "Interfaces"

echo
echo "Testing DNS..."
./bin/network-tool dns lookup google.com >/dev/null
pass "DNS"

echo
echo "Testing ping..."
./bin/network-tool ping run google.com >/dev/null
pass "Ping"

echo
echo "========================================"
echo " All smoke tests passed"
echo "========================================"