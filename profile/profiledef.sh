#!/usr/bin/env bash

# RebuiltArch Archiso profile definition
# See: archiso profiledef.sh documentation

iso_name="rebuiltarch"
iso_label="REBUILTARCH"
iso_publisher="RebuiltArch"
iso_application="RebuiltArch Live Environment"
iso_version="$(date +%Y.%m.%d)"

install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi-x64.systemd-boot')

# Packages and files that should be copied with permissions preserved.
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)
