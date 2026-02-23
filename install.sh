#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew packages
echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# Create symlinks using stow
echo "Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -v -t "$HOME" home

# Apply macOS system preferences
echo "Applying macOS preferences..."
bash "$DOTFILES_DIR/macos.sh"
