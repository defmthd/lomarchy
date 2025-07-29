#!/bin/bash

# Enable Russian locale
if grep '#ru_RU.UTF-8' /etc/locale.gen; then
  sudo sed -i '/^#ru_RU.UTF-8 UTF-8/s/^#//' /etc/locale.gen
  sudo locale-gen
fi

yay -S --noconfirm --needed \
  wget curl unzip inetutils \
  man tldr less fastfetch \
  zsh kitty \
  htop

mkdir -p ~/.config

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh is already installed."
fi

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "==> Setting zsh as default shell..."
  chsh -s "$(which zsh)"
else
  echo "==> zsh is already the default shell."
fi

ZSHRC="$HOME/.zshrc"

if grep -q '^ZSH_THEME=' "$ZSHRC"; then
    echo "==> Updating theme to 'afowler'..."
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="afowler"/' "$ZSHRC"
else
    echo "==> Adding theme to .zshrc..."
    echo 'ZSH_THEME="afowler"' >> "$ZSHRC"
fi

# Link configs
if [ ! -d "$HOME/.config/fastfetch" ]; then
  ln -s $(pwd)/config/fastfetch ~/.config/fastfetch
fi

if [ ! -d "$HOME/.config/kitty" ]; then
  ln -s $(pwd)/config/kitty ~/.config/kitty
fi
