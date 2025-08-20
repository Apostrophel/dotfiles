#!/bin/bash

# Make sure that the script is running from the correct directory
cd "$(dirname "$0")"

# Remove existing symlinks (TODO: Update this line according to new packages added)
rm -f ~/.gitconfig ~/.config/nvim ~/.config/tmux

# Remake the config folder:
mkdir -p ~/.config

# Set up the stow symlinks 
stow -t ~ git 
stow -t ~ nvim
stow -t ~ tmux


# add a source to end of .bashrc to get the bash additions(aliases, functions...)
RELATIVE_PATH=${PWD#$HOME/}
SOURCE_LINE="source ~/$RELATIVE_PATH/shell/bashrc_additions"

if ! grep -q "$SOURCE_LINE" ~/.bashrc; then
    echo "$SOURCE_LINE" >> ~/.bashrc
    echo "Added shell sourcing to .bashrc"
fi

echo "Dotfiles linked!"
