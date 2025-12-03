#!/bin/bash

echo '---> Google Chrome'

yay -S --noconfirm --needed google-chrome

if [ ! -f "$HOME/.config/chrome-flags.conf" ]; then
  ln -s $(pwd)/config/chrome-flags.conf ~/.config/chrome-flags.conf
fi

# Use Chromium as the default browser
xdg-settings set default-web-browser google-chrome.desktop
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
