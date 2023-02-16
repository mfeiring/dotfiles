#!/bin/zsh

# Copy fonts and stuff
cp -a ../fonts/ ~/Library/Fonts/
cp -a ../manual_backups/monitor_profiles/ ~/Library/ColorSync/Profiles

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew bundle

mkdir ~/.nvm 
mkdir ~/development
export STARSHIP_CONFIG=~/dotfiles/config/starship.toml
source ~/dotfiles/.zshrc

# Symlinks
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
ln -s ~/dotfiles/.hyper.js ~/.hyper.js