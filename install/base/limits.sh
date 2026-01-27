#!/bin/bash

echo '---> System limits'

# Install sysctl limits configuration
echo "Installing sysctl desktop limits..."
sudo cp $(pwd)/config/sysctl/99-desktop-limits.conf /etc/sysctl.d/99-desktop-limits.conf
sudo sysctl -p /etc/sysctl.d/99-desktop-limits.conf

# Install PAM limits configuration
echo "Installing PAM user limits..."
sudo mkdir -p /etc/security/limits.d
sudo cp $(pwd)/config/security/limits.conf /etc/security/limits.d/99-desktop-limits.conf

# Verify installations
if [ -f /etc/sysctl.d/99-desktop-limits.conf ]; then
  echo "✓ Sysctl limits installed"
else
  echo "✗ Failed to install sysctl limits"
  exit 1
fi

if [ -f /etc/security/limits.d/99-desktop-limits.conf ]; then
  echo "✓ PAM limits installed"
else
  echo "✗ Failed to install PAM limits"
  exit 1
fi

echo "System limits configured successfully!"
echo "Note: Some limits (like nofile) require logout/login to take effect"
