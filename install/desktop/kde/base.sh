#!/bin/bash

echo '---> Setup KDE base'

yay -S --noconfirm --needed \
    plasma-desktop konsole dolphin ark unrar kscreen bluedevil plasma-pa plasma-nm \
    qt5-wayland qt6-wayland qt5-tools qt6-tools \
    gwenview okular spectacle \
    papirus-icon-theme \
    sddm sddm-kcm \
    xdg-desktop-portal xdg-desktop-portal-kde \
    kde-gtk-config \
    kwallet-pam \
    kdegraphics-thumbnailers ffmpegthumbs \
    breeze breeze-gtk

sudo systemctl enable sddm.service

if [ ! -f "$HOME/.config/kdeglobals" ]; then
  ln -s $(pwd)/config/kde/kdeglobals $HOME/.config/kdeglobals
fi

if [ ! -f "$HOME/.config/plasmarc" ]; then
  ln -s $(pwd)/config/kde/plasmarc $HOME/.config/plasmarc
fi

# Open images with Gwenview
xdg-mime default org.kde.gwenview.desktop image/png
xdg-mime default org.kde.gwenview.desktop image/jpeg
xdg-mime default org.kde.gwenview.desktop image/gif
xdg-mime default org.kde.gwenview.desktop image/webp
xdg-mime default org.kde.gwenview.desktop image/bmp
xdg-mime default org.kde.gwenview.desktop image/tiff

# Open PDFs with Okular
xdg-mime default org.kde.okular.desktop application/pdf
