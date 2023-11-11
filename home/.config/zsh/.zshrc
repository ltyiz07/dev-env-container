# for more configs : https://wiki.archlinux.org/title/zsh

# Set up the prompt
autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ll='ls -alFh --color=auto'

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

fpath=($ZDOTDIR/prompt $fpath)
autoload -Uz purity.zsh; purity.zsh

# tmux
alias tn='function name_tmux() {
  read "session_name?Enter session name: "
  tmux new -s "$session_name"
}
name_tmux'
alias tl='tmux ls'                    # session list
alias td='tmux detach'                # detatch session
alias tk='tmux kill-session -t '      # kill session
alias t4='function my_t4() {
  read "session_name?Enter session name: "
  tmux -u new-session -d -s "$session_name"
  tmux split-window -v
  tmux split-window -h
  tmux select-pane -U
  tmux split-window -h
  tmux select-pane -L
  tmux attach-session -d
}
my_t4'
function tt() {
        if [ -z “$1” ]; then
                tmux
        elif [ -z ${TMUX} ]; then
                tmux attach -t $1
        else
                tmux switch -t $1
        fi
}
