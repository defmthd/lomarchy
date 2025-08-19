#!/bin/bash

echo "Adding user '$USER' to wheel group..."
sudo usermod -aG wheel "$USER"

# Check if wheel group has sudo access
if ! sudo grep -qE '^%wheel\s+ALL=\(ALL\)\s+NOPASSWD:\s+ALL' /etc/sudoers; then
  echo "Enabling wheel group sudo access..."
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers
fi

sudo pacman -S --needed --noconfirm base-devel git curl wget \
  reflector rsync cronie

# Add cachyos repos
if ! grep -qE '^\[.*cachyos.*\]' /etc/pacman.conf; then
  curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
  tar xvf cachyos-repo.tar.xz && cd cachyos-repo
  sudo ./cachyos-repo.sh
  cd ..
  rm -rf cachyos-repo
  rm cachyos-repo.tar.xz
fi

sudo systemctl enable --now cronie.service

if [ ! -f /etc/cron.hourly/reflector ]; then
  echo '#!/bin/bash' | sudo tee /etc/cron.hourly/reflector > /dev/null
  echo "reflector --country 'Russia' -l 20 --sort rate --save /etc/pacman.d/mirrorlist" | sudo tee -a /etc/cron.hourly/reflector > /dev/null
  echo "pacman -Syyy" | sudo tee -a /etc/cron.hourly/reflector > /dev/null
  sudo chmod +x /etc/cron.hourly/reflector
fi

if ! command -v yay &>/dev/null; then
  cd /tmp
  git clone http://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd -
  rm -rf yay-bin
  cd ~/lomarchy

  sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
fi
