#!/bin/bash

echo '---> Setup base command-line tools'

yay -S --noconfirm --needed \
  eza \
  ripgrep \
  unzip \
  inetutils \
  man tldr less \
  fastfetch \
  htop

if [ ! -d "$HOME/.config/eza" ]; then
  ln -s $(pwd)/config/eza ~/.config/eza
fi

if [ ! -d "$HOME/.config/fastfetch" ]; then
  ln -s $(pwd)/config/fastfetch ~/.config/fastfetch
fi
