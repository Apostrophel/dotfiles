#!/bin/bash
#
# Usage: ./setup.sh [i3|regolith]
#
#   (no arg)   only the universal packages (nvim, tmux, git)
#   i3         universal + plain-i3 packages (i3, i3status, i3lock)
#   regolith   universal + regolith package (regolith3)
#
# nvim/tmux/git are window-manager independent and stowed everywhere.
# Pick the WM package matching the machine you're on.

set -e

# Make sure that the script is running from the correct directory
cd "$(dirname "$0")"

WM="${1:-}"

# Remake the config folder:
mkdir -p ~/.config

# Universal packages, stowed on every machine
UNIVERSAL=(git nvim tmux)

# Window-manager specific packages
case "$WM" in
  i3)       WM_PACKAGES=(i3 i3status i3lock) ;;
  regolith) WM_PACKAGES=(regolith3) ;;
  "")       WM_PACKAGES=() ;;
  *)        echo "Unknown WM '$WM'. Use: i3, regolith, or no argument."; exit 1 ;;
esac

PACKAGES=("${UNIVERSAL[@]}" "${WM_PACKAGES[@]}")

# Remove any existing (possibly stale) symlinks for these packages,
# then restow. --restow cleanly relinks without leaving orphans behind.
stow -t ~ --restow "${PACKAGES[@]}"

echo "Stowed: ${PACKAGES[*]}"

# add a source to end of .bashrc to get the bash additions (aliases, functions...)
RELATIVE_PATH=${PWD#$HOME/}
SOURCE_LINE="source ~/$RELATIVE_PATH/shell/bashrc_additions"

if ! grep -q "$SOURCE_LINE" ~/.bashrc; then
    echo "$SOURCE_LINE" >> ~/.bashrc
    echo "Added shell sourcing to .bashrc"
fi

echo "Dotfiles linked!"
