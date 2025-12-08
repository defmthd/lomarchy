#!/bin/bash

echo '---> Setup kitty'

yay -S --noconfirm --needed kitty

if [ ! -d "$HOME/.config/kitty" ]; then
  ln -s $(pwd)/config/kitty ~/.config/kitty
fi
