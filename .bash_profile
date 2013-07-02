export PATH=$PATH:/opt/local/bin:/usr/local/sbin

source /usr/local/etc/bash_completion
source $rvm_path/scripts/completion
source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/tmux

if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1="\[\033[01;32m\]\h\[\033[01;34m\]\$(__git_ps1 \" (%s)\") \w \$\[\033[00m\] "
fi

source "$HOME/.rvm/scripts/rvm"

export PATH="$(brew --prefix)/bin:$PATH"
export HISTSIZE=10000

# Used for Amazon EC2 tools
export JAVA_HOME=/Library/Java/Home
