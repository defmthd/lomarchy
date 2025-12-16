#!/bin/bash

echo '---> Setup power timings'

if [ ! -f "$HOME/.config/powerdevilrc" ]; then
  ln -s $(pwd)/config/powerdevilrc $HOME/.config/powerdevilrc
fi

if [ ! -f "$HOME/.config/kscreenlockerrc" ]; then
  ln -s $(pwd)/config/kscreenlockerrc $HOME/.config/kscreenlockerrc
fi
