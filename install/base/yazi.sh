#!/bin/bash

echo '---> Yazi'

yay -S --noconfirm --needed yazi ffmpeg 7zip jq poppler fd fzf zoxide resvg imagemagick

if [ ! -d "$HOME/.config/yazi" ]; then
  ln -s $(pwd)/config/yazi ~/.config/yazi
fi

# Upgrade yazi plugins
ya pkg upgrade
