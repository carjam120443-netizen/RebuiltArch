#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_DIR="$SCRIPT_DIR/profile"

if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root (for example: sudo ./build.sh)."
    exit 1
fi

if ! command -v mkarchiso >/dev/null 2>&1; then
    echo "mkarchiso was not found. Install the archiso package first."
    exit 1
fi

OUTPUT_DIR="$SCRIPT_DIR/out"
mkdir -p "$OUTPUT_DIR"

mkarchiso -v -o "$OUTPUT_DIR" "$PROFILE_DIR"

echo "RebuiltArch ISO build complete: $OUTPUT_DIR"
