#!/bin/bash

function showHelp () {
  echo "Usage: ./install.sh [options]"
}

configOnly=false
while [[ $# > 0 ]]; do
  key="$1"
  case $key in
    -h|--help)
      showHelp
      shift
      exit
      ;;
    -c|--configOnly)
      configOnly=true
      shift;
  esac
done

# Source files
for f in lib/install/*.sh; do source $f; done

# Script that installs the dotfiles
#
# It creates symlinks to the files contained in
# the source directory

# Set current directory
BASE_DIR=$(dirname $BASH_SOURCE)
cd $BASE_DIR

# Clean directories
find dotfiles/* -maxdepth 0 -type d | \
    sed "s|dotfiles/|$HOME/.|" | \
    xargs -I{} bash -c '([[ -e {} ]] && rm -rf {}) || true'

# Copy files
find dotfiles/* -type d -maxdepth 0 | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp -rf {}'
find dotfiles/* -type f -maxdepth 0 | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp {}'

if [ $configOnly = "false" ]; then
  # Install prerequisites
  install_pkg_manager
  install_git

  # Install tools
  install_vim
  install_tmux
  install_ctags
fi
