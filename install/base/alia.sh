#!/bin/bash

echo '---> Aliases'

if [ ! -f "$HOME/.config/aliases.sh" ]; then
  ln -s $(pwd)/config/aliases.sh ~/.config/aliases.sh
fi

if ! grep -q 'source ~/.config/aliases.sh' ~/.zshrc; then
  echo 'source ~/.config/aliases.sh' >> ~/.zshrc
fi
