#!/bin/bash

yay -S --noconfirm --needed 1password-beta 1password-cli \
    google-chrome telegram-desktop obsidian \
    mpv imv evince

if [ ! -f "$HOME/.config/chrome-flags.conf" ]; then
  ln -s $(pwd)/config/chrome-flags.conf ~/.config/chrome-flags.conf
fi
