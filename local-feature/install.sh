#!/bin/bash
set -e

export TERM=xterm-256color

USER_HOME="${_REMOTE_USER_HOME:-$HOME}"
USER_NAME="${_REMOTE_USER:-vscode}"
TARGET_DIR="$USER_HOME/dotfiles"

echo "Installing TonyTech dotfiles for $USER_NAME in $TARGET_DIR"

if [ -d "$TARGET_DIR" ]; then
    echo "Removing existing dotfiles folder..."
    rm -rf "$TARGET_DIR"
fi

git clone --depth=1 https://github.com/tonytech83/dotfiles.git "$TARGET_DIR"
cd "$TARGET_DIR"

echo "Updating apt and installing required packages..."
sudo apt-get update -y
sudo apt-get install -y stow lsd fontconfig

if [ -f "$USER_HOME/.zshrc" ] && [ ! -L "$USER_HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc -> .zshrc.bak"
    mv "$USER_HOME/.zshrc" "$USER_HOME/.zshrc.bak"
fi

chmod +x install-zsh.sh
./install-zsh.sh

echo "Dotfiles successfully installed for $USER_NAME in $TARGET_DIR"
