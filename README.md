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

## Status

🚧 Early development — the ISO build system and default configuration are being built.
