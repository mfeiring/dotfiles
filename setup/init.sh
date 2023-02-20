#!/bin/zsh

# Copy fonts and stuff
# cp -a fonts/ ~/Library/Fonts/
# might not exist
# cp -a manual_backups/monitor_profiles/ ~/Library/ColorSync/Profiles

# needs xcode cli before this
# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

brew bundle

# check if exists
mkdir ~/.nvm 
mkdir ~/development
# moved to .zshrc
# export STARSHIP_CONFIG=~/dotfiles/config/starship.toml
# source ~/dotfiles/.zshrc
 
# Symlinks - doesn't work if file exists. Do this first?
# Create function that remove files before symlinking
# ln -s ~/dotfiles/gitconfig ~/.gitconfig
# ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
# ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -s ~/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
# ln -s ~/dotfiles/.hyper.js ~/.hyper.js
