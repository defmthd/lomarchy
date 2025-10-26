#!/bin/bash

yay -S --noconfirm --needed \
    plasma-desktop konsole dolphin kscreen bluedevil plasma-nm qt5-tools qt6-tools

source ./install/base/yay.sh
source ./install/base/terminal.sh
source ./install/base/kernel.sh
source ./install/base/firmware.sh

source ./install/desktop/fonts.sh
source ./install/desktop/wine.sh

source ./install/development/development.sh

source ./install/gaming/steam.sh

source ./install/xtra/apps.sh
source ./install/xtra/appsdef.sh
source ./install/xtra/mimetypes.sh
