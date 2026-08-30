#!/usr/bin/env bash

set -euo pipefail

# Always build from the repository root so local and GitHub Actions builds
# use the same paths.
cd -- "$(dirname -- "$0")"

PROFILE_DIR="$(pwd)/profile"
OUTPUT_DIR="$(pwd)/out"

if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root (for example: sudo ./build.sh)."
    exit 1
fi

if ! command -v mkarchiso >/dev/null 2>&1; then
    echo "mkarchiso was not found. Install the archiso package first."
    exit 1
fi

if [[ ! -f "$PROFILE_DIR/profiledef.sh" ]]; then
    echo "Archiso profile not found: $PROFILE_DIR/profiledef.sh"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

mkarchiso -v -o "$OUTPUT_DIR" "$PROFILE_DIR"

echo "RebuiltArch ISO build complete: $OUTPUT_DIR"
