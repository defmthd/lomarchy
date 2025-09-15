#!/bin/bash

yay -S --noconfirm --needed visual-studio-code-bin \
  github-desktop-bin github-cli \
  lazygit \
  cargo clang gcc14 llvm mise \
  stylua \
  jre21-openjdk dbeaver

if ! grep -q 'eval "$(mise activate zsh)"' ~/.zshrc; then
  echo 'eval "$(mise activate zsh)"' >> ~/.zshrc
fi

eval "$(mise activate bash)"

# Ruby
mise settings set ruby.ruby_build_opts "CC=gcc-14 CXX=g++-14"
mise settings add idiomatic_version_file_enable_tools ruby
mise use --global ruby@latest

# Python
mise use --global python@latest
if ! command -v uv &> /dev/null; then
  wget -qO- https://astral.sh/uv/install.sh | sh
fi

# Node.js
mise use --global node@lts

# Lua
if [ ! -d "$HOME/.config/stylua" ]; then
  ln -s $(pwd)/config/stylua ~/.config/stylua
fi


# Zsh
if [ ! -f "$HOME/.config/my.sh" ]; then
  echo '' > ~/.config/my.sh
fi

if [ ! -f "$HOME/.config/aliases.sh" ]; then
  ln -s $(pwd)/config/aliases.sh ~/.config/aliases.sh
fi

if ! grep -q 'source ~/.config/my.sh' ~/.zshrc; then
  echo 'source ~/.config/my.sh' >> ~/.zshrc
fi

if ! grep -q 'source ~/.config/aliases.sh' ~/.zshrc; then
  echo 'source ~/.config/aliases.sh' >> ~/.zshrc
fi

