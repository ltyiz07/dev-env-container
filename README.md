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


## Microsoft Windows

### Chnage Capslock with Ctrl

Run powershell with administrator
```powershell
# Script found at https://superuser.com/a/997448
# Swap details found at https://www.mavjs.org/post/swap-ctrl-and-capslock-on-windows
# Improvement provided by Davido264 in comment below

$hexified = "00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,3a,00,1d,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';
$scancodeMap = Get-ItemProperty -Path $kbLayout -Name "Scancode Map" -ErrorAction Ignore

if ( -not $scancodeMap )
{
	New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);
}
else
{
	Set-ItemProperty -LiteralPath $kbLayout -Name "Scancode Map" -Value ([byte[]]$hexified);
}
```
