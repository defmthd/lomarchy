#!/bin/bash

yay -S --noconfirm --needed \
  hyprland hypridle hyprlock polkit-gnome hyprland-qtutils \
  waybar walker-bin mako swww \
  nautilus sushi gvfs gvfs-smb \
  papirus-icon-theme elementary-icon-theme \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  nwg-look \
  uwsm

if [ ! -d "$HOME/.config/hypr" ]; then
  ln -s $(pwd)/config/hypr ~/.config/hypr
fi

if [ ! -d "$HOME/.config/waybar" ]; then
  ln -s $(pwd)/config/waybar ~/.config/waybar
fi

if [ ! -d "$HOME/.config/walker" ]; then
  ln -s $(pwd)/config/walker ~/.config/walker
fi
