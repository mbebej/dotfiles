# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi
if ! [[ "$PATH" =~ "$HOME/.dotnet/tools" ]]; then # dotnet tools
    PATH="$PATH:$HOME/.dotnet/tools"
fi
if ! [[ "$PATH" =~ "/usr/local/go/bin" ]]; then # go
	PATH="/usr/local/go/bin:$PATH"
fi
if ! [[ $PATH =~ "$HOME/go/bin" ]]; then # go path/tools
    PATH="$HOME/go/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias ll='ls -alF'
alias la='ls -A'
alias grubreboot='grub2-reboot'
weather() {
	curl -4 https://wttr.in/$1
}

 # nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tmux auto start with bash
#tmuxSessions=`tmux ls | grep -v attached` > /dev/null 2>&1
#if [[ -z $TMUX ]]; then
#	if [ "$TERM" != "screen" ] && [[ -n $tmuxSessions ]]; then
#		tmux at
#	else
#		tmux
#	fi
#fi > /dev/null 2>&1

#. "$HOME/.cargo/env"

export GPG_TTY=$(tty)

eval "$(direnv hook bash)"