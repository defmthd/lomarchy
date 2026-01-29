#!/bin/bash

echo '---> Google Chrome'

yay -S --noconfirm --needed google-chrome

# Use Chromium as the default browser
xdg-settings set default-web-browser google-chrome.desktop
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
