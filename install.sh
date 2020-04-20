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

if [ ! -f ~/.tmux.conf ]; then
  echo "~/.tmux.conf does not exist, using tmux.conf"
  echo "# the following added by dyunis/vimrc/install.sh" > ~/.tmux.conf
else
  echo "appending tmux.conf to ~/.tmux.conf"
  echo "" >> ~/.tmux.conf
  echo "# the following added by dyunis/vimrc/install.sh" >> ~/.tmux.conf
fi
cat tmux.conf >> ~/.tmux.conf
echo "" >> ~/.tmux.conf
echo "# makes tmux colors same as base terminal" >> ~/.tmux.conf
echo "set -g default-terminal \"${TERM}\"" >> ~/.tmux.conf
echo "appended to ~/.tmux.conf"

echo "finished all"
