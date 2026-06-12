#!/bin/bash

set -eu -o pipefail

set_file() {
    local fname="$1"
    local dir="${2:-$HOME}"
    echo "DEBUG: dir  =$dir"
    echo "DEBUG: fname=$fname"
    local target="$dir/$fname"
    local source=$(realpath "$fname")
    local trgdir=$(dirname "$target")

    [ -L "$target" ] && { echo "INFO: $target is already a link"; return 0 ; }
    [ -f "$target" ] && \
	mv "$target"{,.bak}

    ln -s "$source" "$trgdir" && \
	echo "INFO: set up $fname"
}

mkdir -p ~/.config/emacs/lisp
mkdir -p ~/.emacs.d

for f in .bashrc .profile .config/bash_aliases .emacs.d/init.el ; do
    set_file "$f"
done

cp --update=none {,~/}.config/emacs/lisp/yaml-mode.el
