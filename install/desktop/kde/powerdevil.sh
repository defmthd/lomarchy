#!/bin/bash

echo '---> Setup powerdevilrc'

if [ ! -f "$HOME/.config/powerdevilrc" ]; then
  sudo ln -s $(pwd)/config/powerdevilrc $HOME/.config/powerdevilrc
fi
