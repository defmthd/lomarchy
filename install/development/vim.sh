#!/bin/bash

yay -S --noconfirm --needed neovim-nightly-bin

if [ ! -d "$HOME/.config/nvim" ]; then
  ln -s $(pwd)/config/nvim ~/.config/nvim
fi

yay -S --noconfirm --needed lua-language-server bash-language-server vscode-json-languageserver

npm install -g @microsoft/compose-language-service

gem install solargraph solargraph-rails --no-document

# Install vscode extensions
# code --install-extension eamodio.gitlens
# code --install-extension anthropic.claude-code
# code --install-extension mads-hartmann.bash-ide-vscode
# code --install-extension castwide.solargraph
# code --install-extension tamasfe.even-better-toml
