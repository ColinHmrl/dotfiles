#!/bin/bash

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create a symlink for nvim configuration
ln -s "$DOTFILES_DIR/.config/nvim" ~/.config/
# autostart
ln -s "$DOTFILES_DIR/.config/autostart" ~/.config/
# polybar
ln -s "$DOTFILES_DIR/.config/polybar" ~/.config/
# vscode
ln -s "$DOTFILES_DIR/.config/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
ln -s "$DOTFILES_DIR/.config/vscode/settings.json" ~/.config/Code/User/settings.json



# # Install Packer
# git clone ——depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/Site/pack/packer/start/packer.nvim


# # open packer to :so and :PackerSync
# nvim .config/nvim/lua/rile/packer.lua   

