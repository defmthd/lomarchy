#!/bin/bash

yay -S --noconfirm --needed visual-studio-code-bin stylua


# Lua
if [ ! -d "$HOME/.config/stylua" ]; then
  ln -s $(pwd)/config/stylua ~/.config/stylua
fi

# Zsh
if [ ! -f "$HOME/.config/my.sh" ]; then
  echo '' > ~/.config/my.sh
fi

if ! grep -q 'source ~/.config/my.sh' ~/.zshrc; then
  echo 'source ~/.config/my.sh' >> ~/.zshrc
fi
