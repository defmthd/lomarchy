#!/bin/bash

echo '---> Setup Zsh'

yay -S --noconfirm --needed zsh starship

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

if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi
