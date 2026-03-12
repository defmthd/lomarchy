#!/bin/bash

echo '---> x670e-taichi modules'

if [ ! -f "/etc/modules-load.d/x670e-taichi.conf" ]; then
  sudo cp $(pwd)/config/modules-load.d/x670e-taichi.conf /etc/modules-load.d/x670e-taichi.conf
fi
