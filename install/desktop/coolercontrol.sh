#!/bin/bash

echo '---> CoolerControl'

paru -S --noconfirm --needed coolercontrol

sudo systemctl enable --now coolercontrold
