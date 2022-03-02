#!/bin/sh
set -e

if [ $# -ne 1 ]; then
  echo "No arguments supplied, call as bash install.sh [install_dir]"
  exit 1
fi

install_dir=$1

echo "copying vimrc.vim"
cat vimrc.vim > $install_dir/.vimrc
echo "overwrote $install_dir/.vimrc with vimrc.vim"

# TODO: make commandline args for copying colors, ftplugin, tmux.conf, snippets

if [ ! -d $install_dir/.vim/colors ]; then
  mkdir -p $install_dir/.vim/colors
fi
cp colors/* $install_dir/.vim/colors
echo "copied contents of colors to local $install_dir/.vim/colors"

if [ ! -d $install_dir/.vim/plugin ]; then
  mkdir -p $install_dir/.vim/plugin
fi
cp plugin/* $install_dir/.vim/plugin
echo "copied contents of plugin to local $install_dir/.vim/plugin"

if [ ! -d $install_dir/.vim/ftplugin ]; then
  mkdir -p $install_dir/.vim/ftplugin
fi
cp ftplugin/* $install_dir/.vim/ftplugin
echo "copied contents of ftplugin to local $install_dir/.vim/ftplugin"

if [ ! -d $install_dir/.vim/snippets ]; then
  mkdir -p $install_dir/.vim/snippets
fi
cp -R snippets/* $install_dir/.vim/snippets
echo "copied contents of snippets to local $install_dir/.vim/snippets"

if [ ! -d $install_dir/.vim/undohistory ]; then
  mkdir -p $install_dir/.vim/undohistory
fi
echo "created dir for undo history at $install_dir/.vim/undohistory"

if [ ! -f $install_dir/.tmux.conf ]; then
  echo "$install_dir/.tmux.conf does not exist, creating tmux.conf"
  echo "# the following added by dyunis/vimrc/install.sh" > $install_dir/.tmux.conf
else
  echo "appending tmux.conf to $install_dir/.tmux.conf"
  echo "" >> $install_dir/.tmux.conf
  echo "# the following added by dyunis/vimrc/install.sh" >> $install_dir/.tmux.conf
fi
cat tmux.conf >> $install_dir/.tmux.conf
echo "" >> $install_dir/.tmux.conf
echo "# makes tmux colors same as base terminal" >> $install_dir/.tmux.conf
echo "set -g default-terminal \"${TERM}\"" >> $install_dir/.tmux.conf
echo "appended to $install_dir/.tmux.conf"

echo "installing indentLine plugin (> vim 8.0) (https://github.com/Yggdroot/indentLine)"
if [ -d $install_dir/.vim/pack/vendor/start/indentLine ]; then
  rm -rf $install_dir/.vim/pack/vendor/start/indentLine
fi
git clone https://github.com/Yggdroot/indentLine.git $install_dir/.vim/pack/vendor/start/indentLine
vim -u NONE -c "helptags  $install_dir/.vim/pack/vendor/start/indentLine/doc" -c "q"
echo "finished installing indentLine"

if [ `pip show flake8 | grep -q 'Package(s) not found'` ]; then
  pip install flake8
fi
echo "installing vim-flake8 plugin (> vim 8.0) (https://github.com/nvie/vim-flake8)"
if [ -d $install_dir/.vim/pack/vendor/start/flake8 ]; then
  rm -rf $install_dir/.vim/pack/vendor/start/flake8
fi
git clone https://github.com/nvie/vim-flake8.git $install_dir/.vim/pack/vendor/start/flake8
vim -u NONE -c "helptags  $install_dir/.vim/pack/vendor/start/flake8/doc" -c "q"
echo "finished installing vim-flake8"

echo "finished all"
