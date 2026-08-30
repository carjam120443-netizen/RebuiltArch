#!/usr/bin/env bash

# RebuiltArch live environment customization
# The live ISO needs an unlocked root account so the console/emergency shell
# can be accessed when required during VM testing and recovery.
passwd -d root

# Keep the live environment convenient for desktop testing.
mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/autologin.conf <<'EOF'
[Autologin]
Session=plasma.desktop
EOF
