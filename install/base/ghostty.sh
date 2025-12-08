#!/bin/bash

echo '---> Setup ghostty'

yay -S --noconfirm --needed ghostty

if [ ! -d "$HOME/.config/ghostty" ]; then
  ln -s $(pwd)/config/ghostty ~/.config/ghostty
fi
