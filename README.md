# RebuiltArch

RebuiltArch is a custom Arch Linux-based operating system project.

## Project Structure

```text
RebuiltArch/
├── README.md
├── LICENSE
├── build.sh
├── profile/
│   ├── airootfs/
│   │   ├── etc/
│   │   ├── usr/
│   │   └── ...
│   ├── packages.x86_64
│   ├── profiledef.sh
│   └── customize_airootfs.sh
├── scripts/
│   ├── setup-desktop.sh
│   ├── setup-packages.sh
│   └── setup-branding.sh
└── .github/
    └── workflows/
        └── build-iso.yml
```

## Goals

- Build a bootable Arch Linux-based ISO
- Provide a customizable desktop environment
- Keep the base system lightweight and practical
- Add custom RebuiltArch branding and configuration
- Automate ISO builds with GitHub Actions
- Test releases in virtual machines before wider use

## Building

The project uses Archiso to assemble the RebuiltArch installation/live ISO. The build configuration lives under `profile/` and can be extended as the project grows.

## Live ISO Login

The RebuiltArch live environment currently provides a temporary account for the live session:

- **Username:** `rebuilt`
- **Password:** `rebuilt`

⚠️ **Important:** This account is intended only for the live environment. Do not use it as your permanent account or reuse this password for any real account.

### Create Your Own User

Once you have booted the live environment, create your own account rather than using the shared live credentials as a permanent account. For example:

```bash
sudo useradd -m -G wheel -s /bin/bash yourusername
sudo passwd yourusername
```

Replace `yourusername` with the username you want to use.

> **Safety note:** The live environment gives you powerful administrative access. Avoid destructive commands, including accidentally deleting system files or partitions. Do not run commands you do not understand, especially commands involving `rm`, disks, partitions, or recursive deletion. The live session is for testing and setup—not for intentionally damaging the system.

## Status

🚧 Early development — the ISO build system and default configuration are being built.
