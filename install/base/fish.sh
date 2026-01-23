#!/bin/bash

echo '---> Setup Fish'

yay -S --noconfirm --needed fish starship

if [ ! -d "$HOME/.config/fish" ]; then
  ln -s $(pwd)/config/fish ~/.config/fish
fi
