#!/bin/bash

echo '---> Setup network'

# Install iwd explicitly if it wasn't included in archinstall
# This can happen if archinstall used ethernet
if ! command -v iwctl &>/dev/null; then
  paru -S --noconfirm --needed iwd
  sudo systemctl enable --now iwd.service
fi

