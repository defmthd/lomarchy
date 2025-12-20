#!/bin/bash

echo '---> Setup keyboard settings'

if [ ! -f "$HOME/.config/kxkbrc" ]; then
  ln -s $(pwd)/config/kxkbrc $HOME/.config/kxkbrc
fi

if [ ! -f "$HOME/.config/kcminputrc" ]; then
  ln -s $(pwd)/config/kcminputrc $HOME/.config/kcminputrc
fi
