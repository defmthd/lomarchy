#!/bin/bash

echo '---> Setup language'

if [ ! -f "$HOME/.config/kwinrulesrc" ]; then
  ln -s $(pwd)/config/kde/kwinrulesrc $HOME/.config/kwinrulesrc
fi
