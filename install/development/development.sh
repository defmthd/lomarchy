#!/bin/bash

yay -S --noconfirm --needed visual-studio-code-bin github-desktop-bin \
  github-cli lazygit \
  stylua

if [ ! -d "$HOME/.config/stylua" ]; then
  ln -s $(pwd)/config/stylua ~/.config/stylua
fi

