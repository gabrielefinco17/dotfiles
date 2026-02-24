#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for the rest of this script (Apple Silicon vs Intel)
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# Install all apps from Brewfile
echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# Create symlinks using stow
echo "Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow -v --no-folding --adopt -t "$HOME" home

# Install VS Code extensions (requires 'code' CLI in PATH)
if command -v code &>/dev/null; then
  echo "Installing VS Code extensions..."
  while IFS= read -r ext; do
    [[ -z "$ext" || "$ext" == \#* ]] && continue
    code --install-extension "$ext" --force
  done < "$DOTFILES_DIR/vscode-extensions.txt"
fi

# Apply macOS system preferences
echo "Applying macOS preferences..."
bash "$DOTFILES_DIR/macos.sh"
