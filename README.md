# Development environment container

## Purpose

### Why?
To create isolated environment
And consistent through machine to machines

### How?
To create docker container that contains development tools

### What?
Automate create development environment

### Preinstalled
* nvim with keymaps
* tmux with configs
* cargo
* nvm + node
* fzf with key configs
* zsh as default terminal

## Things to improve

### docker container
* Map container root to host user

### tmux
* consider pause container to retain tmux sessions
* update envs scripts

### neovim
* neovim version support (install latest automatically)
* auto completion
* auto format code
* jump to implementation
* find all from source code
* change all import directory
 
### vscode
* automate vscode connection

### Java
* add java JDK

## Copied parent config files

* ~/.config/nvim
* ~/.tmux.conf
* ~/.gitconfig
* ~/.git-credentials
* ~/.zshenv
* ~/.config/zsh


TODO: 
* create container user and assign it as host user id
* set container user as root inside container (set as su user)
