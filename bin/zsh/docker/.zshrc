# Lines configured by zsh-newuser-install
HISTFILE=~/workspace/home-sync/bin/zsh/docker/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/pstone/workspace/home-sync/bin/zsh/docker/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


if [[ "$SHELL_MODE" == "docker" ]]; then
	echo "Already in Docker shell mode, quitting."
	exit 1
fi

source $HOME/.zshrc

source $ZDOTDIR/functions

export SHELL_MODE='docker'
