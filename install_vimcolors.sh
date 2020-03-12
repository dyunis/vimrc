#!/bin/sh
set -e

if [ ! -d ~/.vim/colors ]; then
    mkdir -p ~/.vim/colors
fi

cp colors/* ~/.vim/colors
echo "copied colors to local .vim/colors"
