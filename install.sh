#!/bin/sh
set -e

echo "copying vimrc.vim"
cat vimrc.vim > ~/.vimrc
echo "overwrote ~/.vimrc with vimrc.vim"

echo "copying colors"
if [ ! -d ~/.vim/colors ]; then
  mkdir -p ~/.vim/colors
fi

# TODO: make commandline args for copying colors, ftplugin, tmux.conf, snippets
cp colors/* ~/.vim/colors
echo "copied contents of colors to local ~/.vim/colors"
cp ftplugin/* ~/.vim/ftplugin
echo "copied contents of ftplugin to local ~/.vim/ftplugin"
cp -R snippets/* ~/.vim/snippets
echo "copied contents of snippets to local ~/.vim/snippets"

echo "appending to ~/.tmux.conf (if it exists) to make tmux perform correctly"
echo "# makes tmux colors same as base terminal" >> tmux.conf
echo "set -g default-terminal \"${TERM}\"" >> tmux.conf
if [ ! -f ~/.tmux.conf ]; then
  cp tmux.conf ~/.tmux.conf
else
  cat tmux.conf >> ~/.tmux.conf
fi
echo "appended to ~/.tmux.conf"

echo "finished all"
