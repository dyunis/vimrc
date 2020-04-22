#!/bin/sh
set -e

echo "copying vimrc.vim"
cat vimrc.vim > ~/.vimrc
echo "overwrote ~/.vimrc with vimrc.vim"

# TODO: make commandline args for copying colors, ftplugin, tmux.conf, snippets

if [ ! -d ~/.vim/colors ]; then
  mkdir -p ~/.vim/colors
fi
cp colors/* ~/.vim/colors
echo "copied contents of colors to local ~/.vim/colors"

if [ ! -d ~/.vim/plugin ]; then
  mkdir -p ~/.vim/plugin
fi
cp plugin/* ~/.vim/plugin
echo "copied contents of plugin to local ~/.vim/plugin"

if [ ! -d ~/.vim/ftplugin ]; then
  mkdir -p ~/.vim/ftplugin
fi
cp ftplugin/* ~/.vim/ftplugin
echo "copied contents of ftplugin to local ~/.vim/ftplugin"

if [ ! -d ~/.vim/snippets ]; then
  mkdir -p ~/.vim/snippets
fi
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
