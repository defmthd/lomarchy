#!/bin/bash

yay -S --noconfirm --needed \
  wget curl unzip inetutils \
  man tldr less \
  kitty \
  htop

cp -R ./config/kitty ~/.config/