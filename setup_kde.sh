#!/bin/bash

source ./install/base/grub.sh
source ./install/base/yay.sh
source ./install/base/terminal.sh
source ./install/base/kernel.sh
source ./install/base/firmware.sh

yay -S --noconfirm --needed \
    plasma-desktop konsole dolphin ark kscreen bluedevil plasma-pa plasma-nm qt5-tools qt6-tools \
    gwenview okular spectacle \
    elementary-icon-theme papirus-icon-theme nwg-look \
    sddm sddm-kcm \
    xdg-desktop-portal xdg-desktop-portal-kde \
    kde-gtk-config \
    kwallet-pam \
    kdegraphics-thumbnailers ffmpegthumbs \
    breeze breeze-gtk

sudo systemctl enable sddm.service

source ./install/desktop/audio.sh
source ./install/desktop/fonts.sh
source ./install/desktop/wine.sh

source ./install/development/development.sh

source ./install/gaming/steam.sh

yay -S --noconfirm --needed 1password 1password-cli \
    google-chrome telegram-desktop obsidian

if [ ! -f "$HOME/.config/chrome-flags.conf" ]; then
  ln -s $(pwd)/config/chrome-flags.conf ~/.config/chrome-flags.conf
fi

# Use Chromium as the default browser
xdg-settings set default-web-browser google-chrome.desktop
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https

# Open all images with imv
xdg-mime default org.kde.gwenview.desktop image/png
xdg-mime default org.kde.gwenview.desktop image/jpeg
xdg-mime default org.kde.gwenview.desktop image/gif
xdg-mime default org.kde.gwenview.desktop image/webp
xdg-mime default org.kde.gwenview.desktop image/bmp
xdg-mime default org.kde.gwenview.desktop image/tiff

# Open PDFs with the Document Viewer
xdg-mime default org.kde.okular.desktop application/pdf
