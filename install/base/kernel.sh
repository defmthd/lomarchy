#!/bin/bash

echo '---> Add cachyos kernel and headers'

paru -S --noconfirm --needed \
  linux-cachyos linux-cachyos-headers cachyos-settings scx-scheds

sudo grub-mkconfig -o /boot/grub/grub.cfg

if [ ! -f /etc/scx_loader.toml ]; then
  sudo tee /etc/scx_loader.toml > /dev/null <<'EOF'
default_sched = "scx_lavd"
default_mode = "Gaming"
EOF
fi

sudo systemctl enable --now scx_loader
