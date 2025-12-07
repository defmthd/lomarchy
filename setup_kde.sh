#!/bin/bash

source ./install/base/locale.sh
source ./install/base/sudoers.sh
source ./install/base/grub.sh

source ./install/base/yay.sh
source ./install/base/cachyos-repos.sh

source ./install/base/terminal.sh
# source ./install/base/yazi.sh
source ./install/base/alia.sh

source ./install/base/kernel.sh
source ./install/base/modprobe.sh
# source ./install/base/nvidia.sh
source ./install/base/firmware.sh

source ./install/desktop/kde/base.sh

yay -S --noconfirm --needed localsend

sudo systemctl enable sddm.service

source ./install/desktop/audio.sh
source ./install/desktop/fonts.sh
source ./install/desktop/wine.sh

source ./install/development/development.sh
source ./install/development/git.sh
source ./install/development/mise.sh
source ./install/development/dbeaver.sh
source ./install/development/vscode.sh

source ./install/gaming/steam.sh

source ./install/desktop/chrome.sh
source ./install/desktop/1pass.sh

yay -S --noconfirm --needed telegram-desktop obsidian
