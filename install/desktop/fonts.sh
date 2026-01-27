#!/bin/bash

yay -S --noconfirm --needed \
  ttf-segoe-ui-variable \
  ttf-jetbrains-mono-nerd \
  ttf-font-awesome noto-fonts noto-fonts-emoji \
  ttf-fixedsys-excelsior-linux

if [ ! -d "$HOME/.config/fontconfig" ]; then
  ln -s $(pwd)/config/fontconfig ~/.config/fontconfig
fi
