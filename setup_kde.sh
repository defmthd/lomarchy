#!/bin/bash

yay -S --noconfirm --needed \
    plasma-desktop konsole dolphin kscreen bluedevil plasma-nm qt5-tools qt6-tools \
    gwenview okular

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

# Open all images with imv
xdg-mime default org.kde.gwenview.desktop image/png
xdg-mime default org.kde.gwenview.desktop image/jpeg
xdg-mime default org.kde.gwenview.desktop image/gif
xdg-mime default org.kde.gwenview.desktop image/webp
xdg-mime default org.kde.gwenview.desktop image/bmp
xdg-mime default org.kde.gwenview.desktop image/tiff

# Open PDFs with the Document Viewer
xdg-mime default org.kde.okular.desktop application/pdf
