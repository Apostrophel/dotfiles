# My personal dotfiles
These are my personal cofiguration files and install scripts for backing up and easy reinstallation. 

## Install 
Clone the repository and run the script `./install_dotfiles.sh`.

## Updating the configs
The symlink set up should automatically take care of updates, just make sure to update the shell files in this repository, not the `.bashrc` in the home directory.

## Dependencies
```
sudo apt install chafa # This is an image renderer for the terminal, required by the telescope-media-files.nvim plugin for nvim
sudo apt install poppler-utils # required to preview pdf fils in the telescope-media-files.nvim plugin. 

```
