# Purity
# by Kevin Lanni
# https://github.com/therealklanni/purity
# MIT License

# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

prompt_purification_setup() {
	# Autoload zsh's `add-zsh-hook` and `vcs_info` functions
	# (-U autoload w/o substition, -z use zsh style)
	autoload -Uz add-zsh-hook vcs_info

	# Set prompt substitution so we can use the vcs_info_message variable
	setopt prompt_subst

	# Run the `vcs_info` hook to grab git info before displaying the prompt
	add-zsh-hook precmd vcs_info

	# Style the vcs_info message
	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:git*' formats '%b%u%c'
	# Format when the repo is in an action (merge, rebase, etc)
	zstyle ':vcs_info:git*' actionformats '%F{14}⏱ %*%f'
	zstyle ':vcs_info:git*' unstagedstr '*'
	zstyle ':vcs_info:git*' stagedstr '+'
	# This enables %u and %c (unstaged/staged changes) to work,
	# but can be slow on large repos
	zstyle ':vcs_info:*:*' check-for-changes true

	# Set the right side prompt to the vcs_info
	RPROMPT='%F{yellow}%D{%H:%M:%S}%f%F{8} ⎇  $vcs_info_msg_0_%f'
	# Set the left side prompt
	PROMPT='%B%(?..[%?] )%b%n@%U%m%u:%F{green}%~%f> '
}
prompt_purification_setup
