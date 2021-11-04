tmuxSessions==`tmux ls | grep -v attached`
if [[ -z $TMUX ]]; then
	if [ "$TERM" != "screen" ] && [[ -n $tmuxSessions ]]; then
		tmux at
	else
		tmux
	fi
fi

alias pip="pip3"
alias ll='ls -alF'

export CLICOLOR=1

