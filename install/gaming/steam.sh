#!/bin/bash

yay -S --needed \
  cachyos-gaming-meta steam protonplus moonlight-qt

yay -S --noconfirm --needed mangohud

if [ ! -d "$HOME/.config/MangoHud" ]; then
  ln -s $(pwd)/config/MangoHud ~/.config/MangoHud
fi
