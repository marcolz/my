export PATH=$PATH:/opt/local/bin:/usr/local/sbin
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion # for RVM completion
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then source `brew --prefix`/etc/bash_completion.d/git-completion.bash; fi # for Git completion

source /usr/local/etc/bash_completion.d/tmux ;

if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1="\[\033[01;32m\]\h\[\033[01;34m\]\$(__git_ps1 \" (%s)\") \w \$\[\033[00m\] "
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export PATH="$(brew --prefix)/bin:$PATH"
export HISTSIZE=10000

# Used for Amazon EC2 tools
export JAVA_HOME=/Library/Java/Home
