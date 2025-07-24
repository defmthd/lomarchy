#!/bin/bash

# Enable Russian locale
if grep '#ru_RU.UTF-8' /etc/locale.gen; then
  sudo sed -i '/^#ru_RU.UTF-8 UTF-8/s/^#//' /etc/locale.gen
  sudo locale-gen
fi

yay -S --noconfirm --needed \
  wget curl unzip inetutils \
  man tldr less \
  kitty \
  htop

mkdir -p ~/.config

cp -R ./config/kitty ~/.config/
