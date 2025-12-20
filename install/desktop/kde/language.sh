#!/bin/bash

echo '---> Setup language'

if [ ! -f "$HOME/.config/plasma-localerc" ]; then
  ln -s $(pwd)/config/plasma-localerc $HOME/.config/plasma-localerc
fi
