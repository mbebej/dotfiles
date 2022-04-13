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

export GPG_TTY=$(tty)
eval "$(direnv hook zsh)"
