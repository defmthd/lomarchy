#!/bin/bash

echo '---> modprobe'

if [ ! -f "/etc/modprobe.d/legacy.conf" ]; then
  sudo ln -s $(pwd)/config/modprobe/legacy.conf /etc/modprobe.d/legacy.conf
fi
