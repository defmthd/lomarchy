#!/bin/bash

mkdir -p ~/.local/share/icons/hicolor/48x48/apps/
cp ./applications/icons/*.png ~/.local/share/icons/hicolor/48x48/apps/
gtk-update-icon-cache ~/.local/share/icons/hicolor &>/dev/null

mkdir -p ~/.local/share/applications
cp ./applications/*.desktop ~/.local/share/applications/
cp ./applications/hidden/*.desktop ~/.local/share/applications/

