#!/bin/bash

echo '---> Add cachyos kernel and headers'

yay -S --noconfirm --needed \
  linux-cachyos linux-cachyos-headers cachyos-settings scx-scheds

sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo systemctl enable --now scx_loader

if [ ! -f /etc/scx_loader.toml ]; then
  echo "default_sched = \"scx_lavd\"" | sudo tee -a /etc/scx_loader.toml > /dev/null
  echo "default_mode = \"Gaming\"" | sudo tee -a /etc/scx_loader.toml > /dev/null
fi
