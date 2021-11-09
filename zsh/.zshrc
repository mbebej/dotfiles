tmuxSessions=`tmux ls | grep -v attached` > /dev/null 2>&1
if [[ -z $TMUX ]]; then
	if [ "$TERM" != "screen" ] && [[ -n $tmuxSessions ]]; then
		tmux at
	else
		tmux
	fi
fi > /dev/null 2>&1

alias pip="pip3"
alias ll='ls -alF'

export CLICOLOR=1

# Added by Krypton
export GPG_TTY=$(tty)

