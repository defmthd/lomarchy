#!/bin/bash

yay -S --noconfirm --needed \
  linux-cachyos scx-scheds

sudo systemctl enable --now scx

