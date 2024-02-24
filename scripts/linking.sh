#!/bin/bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

#git config file
GIT_CONFIG_FILE=$(readlink -f "$SCRIPT_DIR/../home/.gitconfig")
ln -s $GIT_CONFIG_FILE ~/.gitconfig

#tmux config file
TMUX_CONFIG_FILE=$(readlink -f "$SCRIPT_DIR/../home/.tmux.conf")
ln -s $TMUX_CONFIG_FILE ~/.tmux.conf

#zsh configs
ZSH_ENV_FILE=$(readlink -f "$SCRIPT_DIR/../home/.zshenv")
ZSH_CONFIG_DIR=$(readlink -f "$SCRIPT_DIR/../home/.config/zsh")
ln -s $ZSH_ENV_FILE ~/.zshenv
ln -s $ZSH_CONFIG_DIR ~/.config/zsh

#nvim config
NVIM_CONFIG_DIR=$(readlink -f "$SCRIPT_DIR/../home/.config/nvim")
ln -s $NVIM_CONFIG_DIR ~/.config/nvim
