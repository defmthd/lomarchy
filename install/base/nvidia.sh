#!/bin/bash

paru -S --noconfirm --needed nvidia-open-dkms nvidia-utils lib32-nvidia-utils libva-nvidia-driver

# Configure modprobe
sudo cp $(pwd)/config/modprobe/nvidia.conf /etc/modprobe.d/nvidia.conf

# Configure mkinitcpio
sudo tee /etc/mkinitcpio.conf.d/nvidia.conf <<EOF >/dev/null
MODULES+=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
EOF

sudo mkinitcpio -P


# Set env variables
sudo tee /etc/environment <<EOF >/dev/null
GBM_BACKEND=nvidia-drm
NVD_BACKEND=direct
LIBVA_DRIVER_NAME=nvidia
__GLX_VENDOR_LIBRARY_NAME=nvidia
EOF


# Enable Nvidia services
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service
