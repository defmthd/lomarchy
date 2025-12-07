#!/bin/bash

echo '---> Setup cachyos repos'

if ! grep -qE '^\[.*cachyos.*\]' /etc/pacman.conf; then
  curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
  tar xvf cachyos-repo.tar.xz && cd cachyos-repo
  sudo ./cachyos-repo.sh
  cd ..
  rm -rf cachyos-repo
  rm cachyos-repo.tar.xz
fi
