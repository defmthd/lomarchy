#!/bin/bash

echo '---> Setup language'

if [ ! -f "$HOME/.config/kwinrulesrc" ]; then
  ln -s $(pwd)/config/kwinrulesrc $HOME/.config/kwinrulesrc
fi
