#!/bin/bash

yay -S --noconfirm --needed nvidia-open-dkms nvidia-utils lib32-nvidia-utils libva-nvidia-driver

# Configure modprobe
sudo tee /etc/modprobe.d/nvidia.conf <<EOF >/dev/null
options nvidia_drm modeset=1
options nvidia_drm fbdev=1

options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia NVreg_TemporaryFilePath=/var/tmp
options nvidia NVreg_EnableGpuFirmware=0

options nvidia NVreg_UsePageAttributeTable=1
options nvidia NVreg_InitializeSystemMemoryAllocations=0
options nvidia NVreg_EnableStreamMemOPs=1
EOF

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
