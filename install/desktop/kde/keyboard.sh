#!/bin/bash

echo '---> Setup keyboard settings'

if [ ! -f "$HOME/.config/kxkbrc" ]; then
  ln -s $(pwd)/config/kde/kxkbrc $HOME/.config/kxkbrc
fi

if [ ! -f "$HOME/.config/kcminputrc" ]; then
  ln -s $(pwd)/config/kde/kcminputrc $HOME/.config/kcminputrc
fi

# Add window centering shortcut
kwriteconfig6 --file kglobalshortcutsrc --group kwin --key "Window Move Center" "Meta+Ctrl+C,,Move Window to the Center"
