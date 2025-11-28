#!/bin/bash

yay -S --noconfirm --needed \
  linux-cachyos linux-cachyos-headers cachyos-settings scx-scheds

sudo systemctl enable --now scx_loader

if [ ! -f /etc/scx_loader.toml ]; then
  echo "default_sched = \"scx_lavd\"" | sudo tee -a /etc/scx_loader.toml > /dev/null
  echo "default_mode = \"Gaming\"" | sudo tee -a /etc/scx_loader.toml > /dev/null
fi

# Remove from kernel some legacy
sudo sh -c 'cat > /etc/modprobe.d/local-blacklist.conf << EOF
# printer legacy
blacklist usblp
blacklist lpc_ich

# input legacy
blacklist mousedev
blacklist joydev
EOF'
