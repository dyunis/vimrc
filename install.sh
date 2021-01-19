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

if [ ! -d ~/.vim/undohistory ]; then
  mkdir -p ~/.vim/undohistory
fi
echo "created dir for undo history at ~/.vim/undohistory"

if [ ! -f ~/.tmux.conf ]; then
  echo "~/.tmux.conf does not exist, creating tmux.conf"
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

echo "installing indentLine plugin (> vim 8.0) (https://github.com/Yggdroot/indentLine)"
if [ -d ~/.vim/pack/vendor/start/indentLine ]; then
  rm -rf ~/.vim/pack/vendor/start/indentLine
fi
git clone https://github.com/Yggdroot/indentLine.git ~/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  ~/.vim/pack/vendor/start/indentLine/doc" -c "q"
echo "finished installing indentLine"

echo "finished all"
