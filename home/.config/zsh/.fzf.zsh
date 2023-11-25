if [[ ! "$PATH" == *$ZDOTDIR/plugin/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}$ZDOTDIR/plugin/.fzf/bin"
fi
source "$ZDOTDIR/plugin/.fzf/shell/completion.zsh"
source "$ZDOTDIR/plugin/.fzf/shell/key-bindings.zsh"
