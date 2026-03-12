#!/bin/bash

echo '---> Virtualization'

paru -S --noconfirm --needed qemu-full virt-manager swtpm dnsmasq

# This will add the user to the "libvirt" group so they can use it:
sudo usermod -aG libvirt $USER

# LXC backend (optional, for linux containers, enabling both backends does not conflict):
systemctl enable --now libvirtd.service

# QEMU backend (for VMs):
systemctl enable --now libvirtd.socket

# This will bring Internet up in a VM whenever one starts:
sudo virsh net-autostart default
