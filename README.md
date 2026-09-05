# My personal dotfiles
These are my personal cofiguration files and install scripts for backing up and easy reinstallation. 

## Install
GNU Stow is installed with `sudo apt-get install stow`.

Clone the repository and run `setup.sh` with the window manager for this machine:

```
./setup.sh regolith  # Regolith: universal packages + regolith3
./setup.sh           # universal packages only (nvim, tmux, git)
```

`nvim`, `tmux` and `git` are window-manager independent and stowed on every
machine. To stow an individual package manually: `stow -t ~ <package>`.

## Dependencies
```
sudo apt install chafa # This is an image renderer for the terminal, required by the telescope-media-files.nvim plugin for nvim
sudo apt install poppler-utils # required to preview pdf fils in the telescope-media-files.nvim plugin. 

```
