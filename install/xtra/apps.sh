#!/bin/bash

yay -S --noconfirm --needed 1password 1password-cli \
    google-chrome telegram-desktop obsidian \
    mpv imv evince \
    syncthing \
    gnome-calculator

if [ ! -f "$HOME/.config/chrome-flags.conf" ]; then
  ln -s $(pwd)/config/chrome-flags.conf ~/.config/chrome-flags.conf
fi

# Install requirement for dictation. See: hypr/scripts/record.py
# v pip install --system faster-whisper sounddevice numpy
# uv pip install --system torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.4

systemctl --user enable --now syncthing.service
