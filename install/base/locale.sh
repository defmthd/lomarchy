#!/bin/bash

echo '---> Add RU locale'

# Enable Russian locale
if grep '#ru_RU.UTF-8' /etc/locale.gen; then
  sudo sed -i '/^#ru_RU.UTF-8 UTF-8/s/^#//' /etc/locale.gen
  sudo locale-gen
fi
