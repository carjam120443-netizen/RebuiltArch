#!/usr/bin/env bash

# RebuiltArch live environment customization
# Keep root available for recovery/testing.
passwd -d root

# Create the normal live desktop user.
useradd -m -G wheel,audio,video,storage,optical -s /bin/bash rebuilt
printf '%s\n' 'rebuilt:rebuilt' | chpasswd

# Allow the live user to use sudo.
mkdir -p /etc/sudoers.d
printf '%s\n' 'rebuilt ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/10-rebuilt
chmod 440 /etc/sudoers.d/10-rebuilt

# Make SDDM start the live user's Plasma session automatically.
mkdir -p /etc/sddm.conf.d
cat > /etc/sddm.conf.d/autologin.conf <<'EOF'
[Autologin]
User=rebuilt
Session=plasma.desktop
EOF
