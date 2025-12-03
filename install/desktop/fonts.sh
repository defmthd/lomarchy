#!/bin/bash

yay -S --noconfirm --needed \
  ttf-jetbrains-mono-nerd \
  ttf-segoe-ui-variable \
  ttf-font-awesome noto-fonts noto-fonts-emoji

if [ ! -d "$HOME/.config/fontconfig" ]; then
  ln -s $(pwd)/config/fontconfig ~/.config/fontconfig
fi
