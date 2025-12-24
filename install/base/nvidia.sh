#!/bin/bash

MKINITCPIO_CONF="/etc/mkinitcpio.conf"

NVIDIA_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"

# Remove old values
sudo sed -i 's/\b\(nvidia\|nvidia_modeset\|nvidia_uvm\|nvidia_drm\)\b//g; s/\(\s\+\)/ /g; s/ )/)/' /etc/mkinitcpio.conf

# Add modules at the end of the list
sudo sed -i "/^MODULES=/ s/)/ ${NVIDIA_MODULES})/" /etc/mkinitcpio.conf

# Remove extra spaces
sudo sed -i 's/^MODULES=( */MODULES=(/; s/ *)/)/; s/  */ /g' /etc/mkinitcpio.conf

# Remove kms hook from HOOKS
sudo sed -i '/^HOOKS=/ s/\bkms\b//g; /^HOOKS=/ s/  */ /g' /etc/mkinitcpio.conf

# Add kernel options related to nvidia
if [ ! -f "/etc/modprobe.d/nvidia.conf" ]; then
  sudo cp $(pwd)/config/modprobe/nvidia.conf /etc/modprobe.d/nvidia.conf
fi

sudo mkinitcpio -P

# Install hardware decoding dependencies
yay -S --noconfirm --needed libva-nvidia-driver qt5-wayland qt6-wayland

# Set env variables for proper work
KV_LIST=(
    "GBM_BACKEND=nvidia-drm"
    "__GLX_VENDOR_LIBRARY_NAME=nvidia"
    "NVD_BACKEND=direct"
    "LIBVA_DRIVER_NAME=nvidia"
)

for kv in "${KV_LIST[@]}"; do
    key="${kv%%=*}"

    # Only append if key is missing
    if ! grep -q "^$key=" /etc/environment; then
        echo "$kv" | sudo tee -a /etc/environment >/dev/null
    fi
done



# Setup chrome flags for NVIDIA
rm -f ~/.config/chrome-flags.conf
ln -s $(pwd)/config/chrome-flags-nvidia.conf ~/.config/chrome-flags.conf



# Add nvidia services
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service
