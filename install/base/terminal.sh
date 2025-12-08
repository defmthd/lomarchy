#!/bin/bash

echo '---> Setup base command-line tools'

yay -S --noconfirm --needed \
  unzip inetutils \
  man tldr less fastfetch \
  kitty \
  ripgrep \
  htop \
  eza

# Link configs
if [ ! -d "$HOME/.config/fastfetch" ]; then
  ln -s $(pwd)/config/fastfetch ~/.config/fastfetch
fi

if [ ! -d "$HOME/.config/kitty" ]; then
  ln -s $(pwd)/config/kitty ~/.config/kitty
fi

if [ ! -d "$HOME/.config/ghostty" ]; then
  ln -s $(pwd)/config/ghostty ~/.config/ghostty
fi

if [ ! -d "$HOME/.config/eza" ]; then
  ln -s $(pwd)/config/eza ~/.config/eza
fi
