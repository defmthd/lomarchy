#!/bin/bash

yay -S --noconfirm --needed 1password 1password-cli \
    google-chrome telegram-desktop obsidian \
    mpv imv evince \
    gnome-calculator

if [ ! -f "$HOME/.config/chrome-flags.conf" ]; then
  ln -s $(pwd)/config/chrome-flags.conf ~/.config/chrome-flags.conf
fi
