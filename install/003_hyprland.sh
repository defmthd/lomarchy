#!/bin/bash

yay -S --noconfirm --needed \
  hyprland polkit-gnome hyprland-qtutils \
  waybar walker-bin mako swaybg swayosd \
  nautilus sushi \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  nwg-look \
  uwsm

cp -R ./config/hypr ~/.config/
cp -R ./config/waybar ~/.config/
cp -R ./config/walker ~/.config/
