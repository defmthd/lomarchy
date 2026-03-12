# Lomarchy

## Purpose
- Personal bootstrap repo for configuring an Arch/CachyOS-style Linux environment.
- Main focus is a KDE desktop setup.
- The repo is intentionally script-first and minimal rather than a generalized installer framework.

## Main entrypoints
- `setup_kde.sh`: primary full-machine setup for the KDE desktop environment.
- `cherrypick_config.sh`: symlink a single item from `config/` into `~/.config/`.

## Repository layout
- `install/base/`: system-level bootstrap steps such as locale, sudoers, package tooling, kernel, sysctl, and shell setup.
- `install/desktop/`: desktop applications and desktop-environment-specific setup.
- `install/desktop/kde/`: KDE-specific packages and config wiring.
- `install/development/`: developer tooling packages.
- `install/gaming/`: gaming-related packages and helpers.
- `config/`: source-of-truth dotfiles and config directories that are symlinked into the user config directory.

## Execution model
- Top-level setup scripts `source` many smaller shell scripts in sequence.
- Most scripts are intended to be idempotent or close to it.
- Many scripts assume they are run from the repository root because they use `$(pwd)` for symlink targets.
- Most package installation goes through `paru`, with `pacman` and `sudo` used for system changes.

## Environment assumptions
- Target platform is Arch Linux or a close derivative, with some CachyOS-specific packages and repos.
- Scripts are expected to be run as the target user, not as a root shell.
- `sudo` is available for privileged operations.
- Network access is required for package installs, AUR usage, and repo/bootstrap downloads.

## Editing guidance
- Preserve the current style: small Bash scripts, direct commands, minimal abstraction.
- Favor targeted safety improvements over large refactors.
- Keep symlink-based config management intact unless there is a strong reason to change it.
- When reviewing changes, pay attention to idempotency, sudo safety, and whether a script can accidentally overwrite system files.

## Known sharp edges
- Some scripts use `$(pwd)` instead of deriving the repository path from the script location.
- The setup order in the top-level scripts matters because later steps assume earlier packages or config exist.
- The repo mixes system bootstrap, desktop provisioning, and personal preference config in one flow; not every script is intended to be universally reusable.
