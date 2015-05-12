if [[ "$SHELL_MODE" == "draper" ]]; then
	echo "Already in Draper shell mode, quitting."
	exit 1
fi

source $HOME/.zshrc

source $ZDOTDIR/../vagrant/functions
source $ZDOTDIR/functions

export SHELL_MODE='draper'
export draper=~/popcap/git/draper
\cd $draper

export MYSQL_PASS=popcapdev1
export MYSQL_DEFAULT_DB=draper

# sublime: syntax 'Packages/ShellScript/Shell-Unix-Generic.tmLanguage'
# vim: filetype=sh syntax=sh
