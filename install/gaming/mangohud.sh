#!/bin/bash

echo '---> MangoHud'

yay -S --noconfirm --needed mangohud

if [ ! -d "$HOME/.config/MangoHud" ]; then
  ln -s $(pwd)/config/MangoHud ~/.config/MangoHud
fi
