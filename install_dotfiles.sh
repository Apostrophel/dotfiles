#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from: $DOTFILES_DIR"

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Remove existing configs and create symlinks
echo "Setting up nvim..."
rm -rf ~/.config/nvim
ln -sf "$DOTFILES_DIR/.config/nvim" ~/.config/nvim

echo "Setting up tmux..."
rm -rf ~/.config/tmux
ln -sf "$DOTFILES_DIR/.config/tmux" ~/.config/tmux

# Handle other dotfiles
echo "Setting up shell configs..."
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

# Handle shell configuration - add sourcing to .bashrc if not already present
BASHRC_LINE="source $DOTFILES_DIR/shell/bashrc_additions"

if ! grep -q "$BASHRC_LINE" ~/.bashrc 2>/dev/null; then
    echo "" >> ~/.bashrc
    echo "# Dotfiles configuration" >> ~/.bashrc
    echo "$BASHRC_LINE" >> ~/.bashrc
    echo "✓ Added dotfiles sourcing to ~/.bashrc"
else
    echo "✓ Dotfiles already sourced in ~/.bashrc"
fi

echo ""
echo "Dotfiles installed successfully!"
echo "Source: $DOTFILES_DIR"
echo ""
echo "You may need to:"
echo "- Restart your shell or run 'source ~/.bashrc'"
echo "- Install tmux plugins with prefix + I"
echo "- Install nvim plugins (if using lazy.nvim, they'll install automatically)"
