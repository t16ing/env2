#!/bin/bash

for repo in ~ ~/.vim ~/.config/ranger
do
    cd $repo || exit 1
    branch_unclean="$(git branch --show-current | grep -v 'master\|main')"
    status_unclean="$(git status --porcelain=v1)"
    if [ ! -z "$branch_unclean" ]; then
        echo "$repo: branch is not master or main, update skips."
    elif [ ! -z "$status_unclean" ]; then
        echo "$repo: status is unclean, update skips."
    else
        echo $repo: updating...
        git pull
    fi
done
