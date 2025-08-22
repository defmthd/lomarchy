#!/bin/bash

yay -S --noconfirm --needed \
  linux-cachyos linux-cachyos-headers scx-scheds

sudo systemctl enable --now scx

