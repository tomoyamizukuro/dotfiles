# .bashrc
#hostname

export PS1="[\u@local \w]$"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

tty -s && stty stop undef
tty -s && stty start undef

alias ll='ls -alF'
alias lla='ls -l -a'
 
alias less='ls -l'

alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gche='git checkout'
alias gb='git branch'
alias bashrc='source ~/.bashrc'
alias bash='source ~/.bashrc'
alias glo='git log --oneline'
alias gp='git pull --rebase origin development'
alias gits='git status'






HISTTIMEFORMAT='%Y-%m-%d%T'
export HISTTIMEFORMAT
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'"

