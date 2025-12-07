#!/bin/bash

echo '---> Add current user to sudoers'

echo "Adding user '$USER' to wheel group..."
sudo usermod -aG wheel "$USER"

# Check if wheel group has sudo access
if ! sudo grep -qE '^%wheel\s+ALL=\(ALL\)\s+NOPASSWD:\s+ALL' /etc/sudoers; then
  echo "Enabling wheel group sudo access..."
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers
fi
