#!/bin/bash

echo '---> Setup power timings'

if [ ! -f "$HOME/.config/powerdevilrc" ]; then
  ln -s $(pwd)/config/kde/powerdevilrc $HOME/.config/powerdevilrc
fi

if [ ! -f "$HOME/.config/kscreenlockerrc" ]; then
  ln -s $(pwd)/config/kde/kscreenlockerrc $HOME/.config/kscreenlockerrc
fi
