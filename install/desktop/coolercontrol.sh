#!/bin/bash

echo '---> CoolerControl'

yay -S --noconfirm --needed coolercontrol

sudo systemctl enable --now coolercontrold
