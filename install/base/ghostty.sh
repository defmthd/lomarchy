#!/bin/bash

echo '---> Setup ghostty'

paru -S --noconfirm --needed ghostty

if [ ! -d "$HOME/.config/ghostty" ]; then
  ln -s $(pwd)/config/ghostty ~/.config/ghostty
fi
