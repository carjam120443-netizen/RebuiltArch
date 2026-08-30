#!/usr/bin/env bash
set -euo pipefail

# GitHub Actions provides GITHUB_WORKSPACE. For local builds, use the
# directory the script was launched from.
WORKSPACE="${GITHUB_WORKSPACE:-$PWD}"
PROFILE_DIR="$WORKSPACE/profile"
OUTPUT_DIR="$WORKSPACE/out"
WORK_DIR="$WORKSPACE/work"

printf 'Workspace: %s\n' "$WORKSPACE"
printf 'Profile:   %s\n' "$PROFILE_DIR"
printf 'Output:    %s\n' "$OUTPUT_DIR"
printf 'Work:      %s\n' "$WORK_DIR"

if [[ $EUID -ne 0 ]]; then
    echo "Run this script as root (for example: sudo ./build.sh)."
    exit 1
fi

if ! command -v mkarchiso >/dev/null 2>&1; then
    echo "mkarchiso was not found. Install the archiso package first."
    exit 1
fi

if [[ ! -d "$PROFILE_DIR" ]]; then
    echo "Archiso profile directory not found: $PROFILE_DIR"
    exit 1
fi

if [[ ! -f "$PROFILE_DIR/profiledef.sh" ]]; then
    echo "Archiso profile not found: $PROFILE_DIR/profiledef.sh"
    exit 1
fi

mkdir -p "$OUTPUT_DIR" "$WORK_DIR"

# Explicitly provide Archiso with its work directory. This avoids the
# empty-path realpath failure seen in GitHub Actions.
mkarchiso -v -w "$WORK_DIR" -o "$OUTPUT_DIR" "$PROFILE_DIR"

echo "RebuiltArch ISO build complete: $OUTPUT_DIR"
