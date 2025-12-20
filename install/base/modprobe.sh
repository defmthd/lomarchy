#!/bin/bash

echo '---> modprobe'

if [ ! -f "/etc/modprobe.d/legacy.conf" ]; then
  sudo cp $(pwd)/config/modprobe/legacy.conf /etc/modprobe.d/legacy.conf
  sudo mkinitcpio -P
fi
