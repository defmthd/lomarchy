#!/bin/bash

yay -S --needed \
  steam

yay -S --noconfirm --needed mangohud gamemode

if [ ! -d "$HOME/.config/MangoHud" ]; then
  ln -s $(pwd)/config/MangoHud ~/.config/MangoHud
fi