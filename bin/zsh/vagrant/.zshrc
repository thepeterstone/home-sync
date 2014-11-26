if [[ "$SHELL_MODE" == "vagrant" ]]; then
	echo "Already in Vagrant shell mode, quitting."
	exit 1
fi

source $HOME/.zshrc

export SHELL_MODE='vagrant'

source $ZDOTDIR/functions

# sublime: syntax 'Packages/ShellScript/Shell-Unix-Generic.tmLanguage'
# vim: filetype=sh syntax=sh