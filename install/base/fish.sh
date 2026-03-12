#!/bin/bash

echo '---> Setup Fish'

paru -S --noconfirm --needed fish starship

if [ ! -d "$HOME/.config/fish" ]; then
  ln -s $(pwd)/config/fish ~/.config/fish
fi
