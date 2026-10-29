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
sudo apt install xclip # required by tmux copy-mode to yank to the system clipboard

```

## tmux plugins (persistent sessions)
tmux uses [TPM](https://github.com/tmux-plugins/tpm) with `tmux-resurrect` and
`tmux-continuum` so sessions, windows and pane layouts survive a reboot. The
plugins directory is gitignored; `setup.sh` installs TPM and the plugins
automatically. To do it manually:

```
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
~/.config/tmux/plugins/tpm/bin/install_plugins  # or prefix + I inside tmux
```

Then start tmux once: continuum creates and enables the
`~/.config/systemd/user/tmux.service` user service that starts tmux on boot.

- Save manually: `` prefix + Ctrl-s `` / restore manually: `` prefix + Ctrl-r `` (prefix is `` ` ``)
- Auto-saves every 15 minutes and auto-restores when tmux starts
- Saves are stored in `~/.local/share/tmux/resurrect/`
