#!/bin/bash

ARG="${1}"

if [ ! -f "$HOME/.config/$ARG" ]; then
  ln -s $(pwd)/config/$ARG ~/.config/$ARG
fi
