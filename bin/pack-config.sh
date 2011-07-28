#!/bin/bash

INSTALL="$HOME/workspace/sites/terst.org/docroot/nix"
# pack config files into tarball

function main() {
    OUTFILE=$1
    DIR=$(tempfile -d 2>/dev/null || mktemp -d /tmp/config.XXXXX);

    for f in vimrc screenrc zshrc; do cp $HOME/.$f $DIR/$f; done
    for d in .vim bin; do cp -a $HOME/$d $DIR/$d; done

    cd $DIR
    echo "tar cvjf $OUTFILE *"
    tar cvjf $OUTFILE *
    cd -

    rm $INSTALL/setup-latest.tbz
    ln -s $OUTFILE $INSTALL/setup-latest.tbz

}

function usage() {
    echo "Usage: $0 <outfile>" >&2
    exit 1
}

if [[ $# -lt 1 ]]; then
    OUTFILE="$INSTALL/setup-$(date +%Y%m%d).tbz"
else
    OUTFILE=$1
fi

main $OUTFILE;
