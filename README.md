# Lomarchy

Personal Arch Linux bootstrap for a KDE desktop that feels fast, opinionated, and immediately usable.

It installs the base system tooling, wires in desktop packages, and symlinks this repo's dotfiles into place so the machine starts from a known state instead of growing by drift.

## What it sets up

- `paru` bootstrapping, mirror refresh, and CachyOS repositories
- CachyOS kernel with `scx_loader` and `scx_lavd` scheduler in Gaming mode
- Core shell and terminal tooling such as Fish, Starship, Ghostty, `ripgrep`, `eza`, and `fastfetch`
- KDE Plasma desktop packages and personal KDE defaults
- Development tools such as GitHub CLI, GitHub Desktop, LazyGit, and VS Code
- Gaming packages such as Steam, MangoHud, Moonlight, and CachyOS gaming meta packages
- Personal config trees for KDE, Fish, Ghostty, Neovim, MangoHud, and more

## Philosophy

This repo is not a generic installer framework.

It is a compact, script-first setup for one machine profile:

- Arch Linux
- KDE as the primary desktop
- GRUB already selected as the bootloader path
- `paru` as the package workhorse
- symlinked dotfiles from this repository as the source of truth
- direct Bash scripts over abstractions

The result is intentionally simple to read and easy to change quickly.

## Repository layout

```text
.
├── setup_kde.sh            # main entrypoint
├── install/
│   ├── base/               # system bootstrap
│   ├── desktop/            # desktop apps and DE setup
│   ├── development/        # dev tooling
│   └── gaming/             # gaming-related packages
└── config/                 # dotfiles that get symlinked into ~/.config
```

## Quick start

Clone the repo, move into it, and run the main setup script from the repository root:

```bash
git clone <your-repo-url> ~/lomarchy
cd ~/lomarchy
bash setup_kde.sh
```

Running from the repo root matters because several scripts currently build symlinks with `$(pwd)`.

## Install flow

`setup_kde.sh` sources a sequence of focused scripts:

1. Base system preparation: locale, sudoers, bootloader, package tooling, kernel, firmware, sysctl, IO scheduler
2. User environment: Fish, command-line tools, Ghostty
3. Desktop layer: KDE packages, language, keyboard, power timings, fonts, Wine, app installs
4. Developer tooling: GitHub CLI/Desktop, LazyGit, VS Code
5. Gaming layer: Steam, MangoHud, Moonlight

Most scripts are written to be idempotent or close to it. The intended workflow is to uncomment the pieces you want in [setup_kde.sh](setup_kde.sh) and rerun the script.

## Configuration model

The `config/` directory is the source of truth.

Where possible, install scripts create symlinks into `~/.config` instead of copying files. That keeps local changes visible, makes diffing easy, and avoids hidden divergence between the repo and the machine.

Representative config areas in this repo:

- KDE: globals, Plasma settings, keyboard layout, window rules
- Terminal and shell: Fish, Ghostty, Eza, Fastfetch
- Editor: Neovim
- UI helpers: MangoHud
- Hardware and system tuning: `modprobe`, `sysctl`, CoolerControl profiles

## Assumptions

Before running this setup, the machine should already have:

- a working Arch Linux install
- GRUB in place or chosen as the intended bootloader
- `sudo` configured
- network access
- a non-root target user

The scripts make privileged changes through `sudo`, install packages from official repos and AUR, and enable a few system services.

## Caveats

- This repo is opinionated and personal. It favors speed of maintenance over portability.
- The setup order matters. Later steps assume earlier tools and packages already exist.
- Some packages are CachyOS-specific.
- The setup currently assumes a GRUB-based system path.
- Some scripts are intentionally commented out in [setup_kde.sh](setup_kde.sh); those are optional, not forgotten.
- Several symlink steps depend on running from the repository root.

## Typical customization

The main switchboard is [setup_kde.sh](setup_kde.sh).

To customize the machine, the usual pattern is:

- comment or uncomment install steps in [setup_kde.sh](setup_kde.sh)
- edit the matching files under `config/`
- rerun the setup script

That keeps the repo declarative enough without introducing a heavier orchestration layer.
