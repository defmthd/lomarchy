# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is "lomarchy" - a comprehensive Linux dotfiles and system configuration repository for Arch Linux with Hyprland desktop environment. It contains automated installation scripts and configuration files for a complete development environment.

**Central Entry Point**: `setup.sh` - The main script that orchestrates the entire system installation and configuration process.

## Architecture

The repository is organized into three main areas:

### Installation System (`install/` directory)
- **Base system**: `install/base/` - Core system setup (kernel, terminal, yay package manager)
- **Desktop environment**: `install/desktop/` - Hyprland, audio, network, bluetooth, fonts, wine
- **Development tools**: `install/development/` - VSCode, GitHub tools, programming languages, Neovim
- **Gaming**: `install/gaming/` - Steam configuration
- **Extra applications**: `install/xtra/` - Additional apps and mimetypes

### Configuration Files (`config/` directory)
- **Neovim**: `config/nvim/` with Lazy.nvim plugin manager and Lua configuration
- **Walker**: `config/walker/` application launcher with custom themes
- **Yazi**: `config/yazi/` file manager with plugins and flavors
- **StyLua**: `config/stylua/` Lua code formatter configuration
- **Shell**: `config/aliases.sh` and `config/my.sh` for shell customization

### Development Environment
- **Language managers**: mise for Ruby, Python, Node.js version management
- **Package managers**: yay (AUR), uv (Python), npm (Node.js)
- **Development tools**: GitHub CLI, lazygit, VSCode, Neovim
- **Code formatting**: StyLua for Lua (2-space indentation, auto-prefer single quotes)

## Common Commands

### System Setup
```bash
# Run complete system setup
./setup.sh

# Apply personal configuration injection
./addmy.sh
```

### Development Workflows
```bash
# Update system packages
ul  # alias for: yay -Suy --noconfirm --needed

# Update mirror list (Russia-optimized)
ur  # alias for: sudo reflector --verbose --country 'Russia' -l 20 --sort rate --save /etc/pacman.d/mirrorlist

# File management
y   # alias for: yazi file manager

# Text editing
vim # alias for: nvim
```

### Code Formatting
```bash
# Format Lua code (uses config/stylua/stylua.toml)
stylua path/to/file.lua
```

## Key Configuration Details

### Neovim Setup
- Uses Lazy.nvim plugin manager with automatic plugin updates
- Leader key: `<Space>`, Local leader: `\`
- Configuration split into modular plugins in `config/nvim/lua/plugins/`
- Automatic lazy.nvim bootstrap on first run

### Shell Environment
- Zsh with mise integration for runtime version management
- Custom aliases defined in `config/aliases.sh`
- Personal configuration in `~/.config/my.sh` (created via `addmy.sh`)

### Walker Application Launcher
- Custom "lomarchy" theme in `config/walker/mythemes/`
- Minimal interface with translation support
- Most builtins disabled for clean experience

## Development Environment Management

Languages are managed via mise:
- **Ruby**: Latest with GCC-14 compatibility settings
- **Python**: Latest with uv package manager integration  
- **Node.js**: LTS version
- **Lua**: StyLua formatter with 2-space indentation

Configuration symlinks are created during installation, pointing from `~/.config/` to this repository's `config/` directory.