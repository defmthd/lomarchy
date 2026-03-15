#!/bin/bash

echo '---> Setup cachyos repos'

if ! grep -qE '^\[.*cachyos.*\]' /etc/pacman.conf; then
  curl -fsSL https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
  tar xf cachyos-repo.tar.xz
  sudo cachyos-repo/cachyos-repo.sh
  rm -rf cachyos-repo cachyos-repo.tar.xz
fi
