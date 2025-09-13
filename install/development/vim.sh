#!/bin/bash

yay -S --noconfirm --needed neovim

if [ ! -d "$HOME/.config/nvim" ]; then
  ln -s $(pwd)/config/nvim ~/.config/nvim
fi

yay -S --noconfirm lua-language-server bash-language-server

gem install solargraph --no-document
