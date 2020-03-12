#!/bin/sh
set -e

chmod +x install_vimrc.sh
./install_vimrc.sh
chmod +x install_vimcolors.sh
./install_vimcolors.sh
echo "finished installing to local ~"
