#!/bin/bash
# Multi-machine symlink deployment script for dotfiles
# Usage: ./symlink.sh [--force]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
FORCE=false

if [[ "${1:-}" == "--force" ]]; then
    FORCE=true
fi

echo "=========================================="
echo " Starting dotfiles symlink deployment"
echo " Dotfiles directory: $DOTFILES_DIR"
echo "=========================================="

# Helper function to create symlinks safely
link_file() {
    local src="$1"
    local dest="$2"
    
    # Ensure source exists
    if [[ ! -e "$src" ]]; then
        echo "⚠️  Source does not exist: $src"
        return
    fi
    
    # Ensure destination parent folder exists
    mkdir -p "$(dirname "$dest")"
    
    # Handle existing destination
    if [[ -e "$dest" || -L "$dest" ]]; then
        # If it's already a symlink pointing to the correct source
        if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
            echo "✅ Already linked: $dest"
            return
        fi
        
        # Backup existing file/directory if it's not a symlink to the correct source
        echo "📦 Backing up existing: $dest -> $BACKUP_DIR/"
        mkdir -p "$BACKUP_DIR"
        mv "$dest" "$BACKUP_DIR/"
    fi
    
    # Create the symlink
    ln -s "$src" "$dest"
    echo "🔗 Created symlink: $dest"
}

# Helper function to initialize local overrides from examples
init_local_file() {
    local example="$1"
    local dest="$2"
    
    if [[ ! -f "$dest" ]]; then
        if [[ -f "$example" ]]; then
            mkdir -p "$(dirname "$dest")"
            cp "$example" "$dest"
            echo "✨ Initialized local override: $dest (Customize this file!)"
        fi
    else
        echo "ℹ️  Local override already exists: $dest"
    fi
}

# --- Core Configurations ---

# Zsh Configs
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"

# SSH Config
link_file "$DOTFILES_DIR/.ssh/config" "$HOME/.ssh/config"

# Config Directory Files
link_file "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
link_file "$DOTFILES_DIR/.config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
link_file "$DOTFILES_DIR/.config/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
link_file "$DOTFILES_DIR/.config/waybar/style.css" "$HOME/.config/waybar/style.css"
link_file "$DOTFILES_DIR/.config/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
link_file "$DOTFILES_DIR/.config/ghostty/config" "$HOME/.config/ghostty/config"

# Neovim (Link the whole directory recursively or the directory itself)
# LazyVim has many files, symlinking the folder is cleanest
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

# --- Initialize Local Overrides ---
init_local_file "$DOTFILES_DIR/.config/hypr/local.conf.example" "$HOME/.config/hypr/local.conf"
init_local_file "$DOTFILES_DIR/.config/nvim/lua/config/local.lua.example" "$HOME/.config/nvim/lua/config/local.lua"
init_local_file "$DOTFILES_DIR/.zshrc.local.example" "$HOME/.zshrc.local"

echo "=========================================="
echo " Symlink deployment complete!"
if [[ -d "$BACKUP_DIR" ]]; then
    echo " Old configurations backed up to: $BACKUP_DIR"
fi
echo "=========================================="
