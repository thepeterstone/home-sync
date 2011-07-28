#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <source-file>" >&2; exit 1
else
    WD=$(pwd)
    if [ -f $1 ]; then
        SOURCEFILE=$1
    else
        SOURCEFILE=$WD'/'$1
    fi
    FILENAME=$(basename $SOURCEFILE)
    TESTFILE=$(dirname $SOURCEFILE)"/test/"${FILENAME%.php}"Test.php"
    if [ ! -f "$TESTFILE" ]; then
        echo "No test found at $TESTFILE" >&2; exit 2
    fi
    cd $(dirname $TESTFILE)
    phpunit $(basename $TESTFILE)
    cd -
fi
