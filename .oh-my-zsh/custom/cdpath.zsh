#!/usr/bin/env bash

export CDPATH=".:$HOME/.dirlinks"

function link_if_needed {
    [ ! -L ~/.dirlinks/$2 ] && echo "creating symlink $2 for $1" && ln -s ~/$1/ ~/.dirlinks/$2
}

link_if_needed Developer dev
link_if_needed Documents doc
link_if_needed Downloads dow
