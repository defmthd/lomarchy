#!/bin/bash

echo '---> MangoHud'

paru -S --noconfirm --needed mangohud

if [ ! -d "$HOME/.config/MangoHud" ]; then
  ln -s $(pwd)/config/MangoHud ~/.config/MangoHud
fi
