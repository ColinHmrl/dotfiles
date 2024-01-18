#!/bin/bash

# Get the absolute path to the dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create a symlink for nvim configuration
ln -s "$DOTFILES_DIR/.config/nvim" ~/.config/nvim
