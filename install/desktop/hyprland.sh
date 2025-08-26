#!/bin/bash

yay -S --noconfirm --needed \
  hyprland hypridle hyprlock hyprsunset polkit-gnome hyprland-qtutils \
  waybar walker-bin libqalculate mako swww wlogout \
  nautilus sushi gvfs gvfs-smb \
  papirus-icon-theme elementary-icon-theme \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  grim slurp swappy wl-clipboard \
  nwg-look \
  uwsm \
  kanshi \
  brightnessctl \
  swayosd

sudo systemctl enable --now swayosd-libinput-backend.service

if [ ! -d "$HOME/.config/hypr" ]; then
  ln -s $(pwd)/config/hypr ~/.config/hypr
fi

if [ ! -d "$HOME/.config/mako" ]; then
  ln -s $(pwd)/config/mako ~/.config/mako
fi

if [ ! -d "$HOME/.config/waybar" ]; then
  ln -s $(pwd)/config/waybar ~/.config/waybar
fi

if [ ! -d "$HOME/.config/wlogout" ]; then
  ln -s $(pwd)/config/wlogout ~/.config/wlogout
fi

if [ ! -d "$HOME/.config/walker" ]; then
  ln -s $(pwd)/config/walker ~/.config/walker
fi

if [ ! -d "$HOME/.config/gtk-3.0" ]; then
  ln -s $(pwd)/config/gtk-3.0 ~/.config/gtk-3.0
fi

if [ ! -d "$HOME/.config/gtk-4.0" ]; then
  ln -s $(pwd)/config/gtk-4.0 ~/.config/gtk-4.0
fi

if [ ! -d "$HOME/.config/xsettingsd" ]; then
  ln -s $(pwd)/config/xsettingsd ~/.config/xsettingsd
fi

if [ ! -d "$HOME/.config/kanshi" ]; then
  ln -s $(pwd)/config/kanshi ~/.config/kanshi
fi

if [ ! -d "$HOME/.config/swayosd" ]; then
  ln -s $(pwd)/config/swayosd ~/.config/swayosd
fi

