#!/bin/bash

sudo pacman -S --needed --noconfirm base-devel git \
  reflector rsync cronie

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
