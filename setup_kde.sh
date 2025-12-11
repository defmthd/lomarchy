#!/bin/bash

mkdir -p ~/.config

source ./install/base/locale.sh
source ./install/base/sudoers.sh
source ./install/base/grub.sh

source ./install/base/yay.sh
source ./install/base/cachyos-repos.sh

source ./install/base/zsh.sh
source ./install/base/commandline.sh

source ./install/base/alia.sh

# source ./install/base/kitty.sh
source ./install/base/ghostty.sh

# source ./install/base/yazi.sh

source ./install/base/kernel.sh
source ./install/base/modprobe.sh

# source ./install/base/nvidia.sh
source ./install/base/firmware.sh

source ./install/desktop/kde/base.sh
source ./install/desktop/kde/powerdevil.sh
source ./install/desktop/kde/mountfix.sh

# source ./install/desktop/audio.sh
source ./install/desktop/fonts.sh
source ./install/desktop/wine.sh

# source ./install/development/git.sh
# source ./install/development/mise.sh
# source ./install/development/vscode.sh
# source ./install/development/dbeaver.sh

source ./install/desktop/chrome.sh
source ./install/desktop/1pass.sh
# source ./install/desktop/telegram.sh
# source ./install/desktop/obsidian.sh
# source ./install/desktop/localsend.sh

source ./install/gaming/steam.sh
source ./install/gaming/mangohud.sh
# source ./install/gaming/sunshine.sh
# source ./install/gaming/moonlight.sh
