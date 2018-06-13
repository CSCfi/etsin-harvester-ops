# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias pyenv='sudo su apache && . /usr/share/httpd/.bashrc'
