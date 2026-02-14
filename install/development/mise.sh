#!/bin/bash

paru -S --noconfirm --needed cargo clang gcc14 llvm mise libyaml

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
