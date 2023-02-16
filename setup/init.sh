#!/bin/zsh

# Copy fonts
cp -a fonts/ ~/Library/Fonts/

# Symlinks
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/development/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/development/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/development/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User/snippets

# This installs homebrew itself, and also the command line tools in silent mode
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew bundle

mkdir ~/.nvm 
mkdir ~/development
export STARSHIP_CONFIG=~/dotfiles/config/starship.toml
source ~/dotfiles/.zshrc