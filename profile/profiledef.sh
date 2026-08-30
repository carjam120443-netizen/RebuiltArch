#!/usr/bin/env bash

# RebuiltArch Archiso profile definition

iso_name="rebuiltarch"
iso_label="REBUILTARCH"
iso_publisher="RebuiltArch"
iso_application="RebuiltArch Live Environment"
iso_version="$(date +%Y.%m.%d)"

install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi-x64.systemd-boot')

file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/usr/local/bin/rebuiltarch-fetch"]="0:0:755"
)
