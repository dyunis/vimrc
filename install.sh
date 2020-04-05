#!/bin/sh
set -e

echo "copying vimrc.vim"
cat vimrc.vim > ~/.vimrc
echo "overwrote ~/.vimrc with vimrc.vim"

echo "copying colors"
if [ ! -d ~/.vim/colors ]; then
  mkdir -p ~/.vim/colors
fi

cp colors/* ~/.vim/colors
echo "copied colors to local ~/.vim/colors"

echo "appending to ~/.tmux.conf (if it exists) to make tmux perform correctly"
if [ ! -f ~/.tmux.conf ]; then
  touch ~/.tmux.conf
fi
echo "# makes tmux colors same as base terminal" >> ~/.tmux.conf
echo "set -g default-terminal \"${TERM}\"" >> ~/.tmux.conf
echo "appended to ~/.tmux.conf"

echo "finished all"
