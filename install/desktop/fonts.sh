#!/bin/bash

yay -S --noconfirm --needed \
  ttf-ms-win11-auto ttf-jetbrains-mono-nerd ttf-fantasque-nerd \
  ttf-font-awesome noto-fonts noto-fonts-emoji \
  noto-fonts-cjk noto-fonts-extra

if [ ! -d "$HOME/.config/fontconfig" ]; then
  ln -s $(pwd)/config/fontconfig ~/.config/fontconfig
fi
