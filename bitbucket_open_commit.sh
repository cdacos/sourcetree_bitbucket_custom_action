#!/bin/sh

# SourceTree|Preferences|Custom Actions|Add
# Menu Caption: Bitbucket
# Script to run: <local path to this file>
# Parameters: $SHA $FILE

function github_base_url() {
  giturl=$(git config --get remote.origin.url)
  giturl=${giturl/://}
  giturl=${giturl/git\@/}
  giturl=${giturl/\.git/}
  echo $giturl
}

if [ -z "$2" ]; then # We don't have a FILE, so jump to the commit itself
  open "https://$(github_base_url)/commits/$1"
else
  # open "https://$(github_base_url)/src/$1/$2" # open the source as it was committed
  open "https://$(github_base_url)/diff/$2?diff2=$1&at=master" # diff the source from the commit
fi
