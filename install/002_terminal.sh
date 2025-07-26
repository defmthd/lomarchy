#!/bin/bash

# Enable Russian locale
if grep '#ru_RU.UTF-8' /etc/locale.gen; then
  sudo sed -i '/^#ru_RU.UTF-8 UTF-8/s/^#//' /etc/locale.gen
  sudo locale-gen
fi

yay -S --noconfirm --needed \
  wget curl unzip inetutils \
  man tldr less fastfetch \
  kitty \
  htop

mkdir -p ~/.config

if [ ! -d "$HOME/.config/fastfetch" ]; then
  ln -s $(pwd)/config/fastfetch ~/.config/fastfetch
fi

if [ ! -d "$HOME/.config/kitty" ]; then
  ln -s $(pwd)/config/kitty ~/.config/kitty
fi
