export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=1000000

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution

#tmuxSessions=`tmux ls | grep -v attached` > /dev/null 2>&1
#if [[ -z $TMUX ]]; then
#	if [ "$TERM" != "screen" ] && [[ -n $tmuxSessions ]]; then
#		tmux at
#	else
#		tmux
#	fi
#fi > /dev/null 2>&1

NPM_CONFIG_PREFIX=$HOME/.npm-global

if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$NPM_CONFIG_PREFIX/bin" ]]; then # npm
    PATH="$PATH:$NPM_CONFIG_PREFIX/.npm-global/bin"
fi
if ! [[ "$PATH" =~ "$HOME/.dotnet/tools" ]]; then # dotnet tools
    PATH="$PATH:$HOME/.dotnet/tools"
fi
if ! [[ "$PATH" =~ "/usr/local/go/bin" ]]; then # go
    PATH="/usr/local/go/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/go/bin" ]]; then # go path / tools
    PATH="$HOME/go/bin:$PATH"
fi

alias pip="pip3"
alias ll='ls -alF'
weather() {
	curl -4 https://wttr.in/$1
}

export CLICOLOR=1
export DOTNET_WATCH_RESTART_ON_RUDE_EDIT=1
export GPG_TTY=$(tty)
eval "$(direnv hook zsh)"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%F{red}%b%f)'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='[%n@%m %1~${vcs_info_msg_0_}]%# '
