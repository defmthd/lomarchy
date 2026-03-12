#!/bin/bash

echo '---> CoolerControl'

paru -S --noconfirm --needed coolercontrol

sudo systemctl enable --now coolercontrold

BOARD=$(cat /sys/class/dmi/id/board_name 2>/dev/null)

case "$BOARD" in
  "X670E Taichi")
    CONFIG_DIR="$(pwd)/config/coolercontrol/x670e-taichi"
    ;;
  "MAG B850 TOMAHAWK WIFI")
    CONFIG_DIR="$(pwd)/config/coolercontrol/b850-tomahawk"
    ;;
  *)
    echo "---> Board '$BOARD' not recognized, skipping coolercontrol config symlinks"
    exit 0
    ;;
esac

if [ ! -e /etc/coolercontrol ]; then
  sudo ln -s "$CONFIG_DIR" /etc/coolercontrol
fi
