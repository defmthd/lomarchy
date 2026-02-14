#!/bin/bash

echo '---> Setup pacman mirrors and paru'

sudo pacman -S --needed --noconfirm base-devel git curl wget \
  reflector rsync cronie

sudo systemctl enable --now cronie.service

if [ ! -f /etc/cron.hourly/reflector ]; then
  echo '#!/bin/bash' | sudo tee /etc/cron.hourly/reflector > /dev/null
  echo "reflector --country 'Russia' -l 20 --sort rate --save /etc/pacman.d/mirrorlist" | sudo tee -a /etc/cron.hourly/reflector > /dev/null
  echo "pacman -Syyy" | sudo tee -a /etc/cron.hourly/reflector > /dev/null
  sudo chmod +x /etc/cron.hourly/reflector

  # Update reflector on first install
  reflector --country 'Russia' -l 20 --sort rate --save /etc/pacman.d/mirrorlist
fi

if ! command -v paru &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si --noconfirm
  cd -
  rm -rf paru
  cd ~/lomarchy
fi

sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
