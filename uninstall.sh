#/bin/bash


# Get the absolute path to the dotfiles directory
# DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create a symlink for nvim configuration
unlink ~/.config/nvim
# autostart
unlink ~/.config/autostart
# polybar
unlink ~/.config/polybar
# vscode
unlink ~/.config/Code/User/keybindings.json
unlink ~/.config/Code/User/settings.json 

