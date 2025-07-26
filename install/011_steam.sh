#!/bin/bash

yay -S --needed \
  steam moonlight-qt

yay -S --noconfirm --needed mangohud gamemode xpadneo-dkms

if [ ! -d "$HOME/.config/MangoHud" ]; then
  ln -s $(pwd)/config/MangoHud ~/.config/MangoHud
fi
