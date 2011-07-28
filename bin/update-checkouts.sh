#!/bin/bash

TARGET='/home/peter/workspace/sites/terst.org/docroot/docs'
SOURCE='/home/peter/workspace/msft'

OLD_PWD=$(pwd)
#for dir in $(ls $SOURCE); do
for dir in "AzurePHPTools WindowsAzureSDKforPHP"; do
  if [ $(ls $SOURCE/$dir/trunk >/dev/null 2>&1) ]; then
    project="$dir/trunk"
  else
    project=$dir
  fi
  cd $SOURCE/$project
  svn update
  phpdoc -d . -t $TARGET/$dir
done

cd $OLD_PWD
