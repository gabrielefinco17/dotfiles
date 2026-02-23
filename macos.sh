#!/usr/bin/env bash
# macOS system preferences — run once after a fresh install.
# Requires logout/restart to take full effect.

set -e

# ── Finder ────────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain AppleShowAllExtensions -bool true   # show file extensions
defaults write com.apple.finder AppleShowAllFiles -bool true      # show hidden files
defaults write com.apple.finder ShowPathbar -bool true            # show full path at the bottom of Finder windows
defaults write com.apple.finder ShowStatusBar -bool true           # show item count / disk-space bar
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"          # default to list view
defaults write com.apple.finder _FXSortFoldersFirst -bool true               # sort folders before files
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false   # don't warn when changing a file extension

# ── Dock ──────────────────────────────────────────────────────────────────────
defaults write com.apple.dock autohide -bool true                  # auto-hide the Dock
defaults write com.apple.dock autohide-delay -float 0              # no delay before the Dock appears
defaults write com.apple.dock autohide-time-modifier -float 0.3   # slide-in animation duration (seconds)
defaults write com.apple.dock tilesize -int 48                     # icon size in pixels
defaults write com.apple.dock show-recents -bool false             # hide "Recent Applications" section

# ── Keyboard ──────────────────────────────────────────────────────────────────
defaults write NSGlobalDomain KeyRepeat -int 2                                  # key repeat rate (lower = faster; default 6)
defaults write NSGlobalDomain InitialKeyRepeat -int 15                           # delay before repeat starts (lower = shorter; default 25)
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false   # disable auto-correct
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false    # disable smart quotes (" -> \u201c\u201d)
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false     # disable smart dashes (-- -> \u2014)

# ── Trackpad ──────────────────────────────────────────────────────────────────
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true   # enable tap-to-click on the trackpad
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1                       # enable tap-to-click globally (including login screen)

# ── Screenshots ───────────────────────────────────────────────────────────────
defaults write com.apple.screencapture location -string "${HOME}/Desktop"   # save screenshots to Desktop
defaults write com.apple.screencapture type -string "png"                   # screenshot format (png, jpg, tiff, pdf)
defaults write com.apple.screencapture disable-shadow -bool true            # no window shadow in screenshots

# ── Mos (smooth scrolling) ────────────────────────────────────────────────────
defaults write com.caldis.Mos smooth -bool true            # enable smooth scrolling
defaults write com.caldis.Mos reverse -bool false          # don't reverse scroll direction (Mos-level)
defaults write com.caldis.Mos speed -float 7.71            # scroll speed multiplier
defaults write com.caldis.Mos duration -float 4.07         # scroll animation duration
defaults write com.caldis.Mos precision -float 1.0         # scroll precision
defaults write com.caldis.Mos step -float 16.23            # scroll step size (pixels per event)
defaults write com.caldis.Mos hideStatusItem -bool true    # hide the menu-bar icon

killall Finder Dock 2>/dev/null || true
echo "Done. Log out and back in for all changes to take full effect."
