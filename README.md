# Dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

**Configs:** git, neovim, Warp terminal

**Apps (via Homebrew):** neovim, python, Warp, VS Code, Rectangle, Docker, Chrome, Mos, Spotify, VLC, Zoom, Obsidian, MAMP, Logi Options+

**macOS preferences:** Finder, Dock, keyboard, trackpad, screenshots, Mos

## Fresh macOS Setup

### 1. Install Xcode Command Line Tools

Open Terminal and run:

```bash
xcode-select --install
```

Follow the dialog that pops up and wait for it to finish. This installs `git`, `clang`, and other developer essentials.

### 2. Clone the repo

```bash
git clone https://github.com/gabrielefinco17/dotfiles.git ~/.dotfiles
```

### 3. Run the installer

```bash
~/.dotfiles/install.sh
```

This will, in order:

1. **Install Homebrew** if not present
2. **Install all apps** from the Brewfile
3. **Symlink all configs** into `$HOME` via stow
4. **Apply macOS preferences** (Finder and Dock restart automatically)

### 4. Grant permissions

Some apps need accessibility permissions. macOS will prompt you on first launch, but you can also set them up in **System Settings > Privacy & Security > Accessibility**:

- **Rectangle** — window snapping shortcuts
- **Mos** — scroll smoothing

### 5. Log out and back in

Some macOS preferences (keyboard repeat rate, trackpad tap-to-click, smart quotes) only take full effect after a re-login.
