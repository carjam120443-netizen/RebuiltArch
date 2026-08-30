#!/usr/bin/env bash

# RebuiltArch live environment initialization

set -u

# Make NetworkManager available immediately in the live session.
systemctl start NetworkManager.service 2>/dev/null || true

# Display a small welcome message on the live console.
printf '\nWelcome to RebuiltArch!\n'
printf 'Use "archinstall" to begin an Arch Linux installation.\n\n'
