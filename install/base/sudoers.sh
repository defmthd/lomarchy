#!/bin/bash

echo '---> Add current user to sudoers'

echo "Adding user '$USER' to wheel group..."
sudo usermod -aG wheel "$USER"

# Check if wheel group has sudo access
if [ ! -f /etc/sudoers.d/wheel-nopasswd ]; then
  echo "Enabling wheel group sudo access..."
  echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/wheel-nopasswd > /dev/null
  sudo chmod 440 /etc/sudoers.d/wheel-nopasswd
fi
