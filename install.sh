#!/bin/bash

function showHelp () {
  echo "Usage: ./install.sh [options]"
}

clean=false
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
      ;;
    --clean)
      clean=true
      shift;
      ;;
  esac
done

# Source files
for f in lib/*.sh; do source $f; done

# Script that installs the dotfiles
#
# It creates symlinks to the files contained in
# the source directory

# Set current directory
BASE_DIR=$(dirname $BASH_SOURCE)
cd $BASE_DIR

if [ $clean = "true" ]; then
  # Clean directories
  find dotfiles/* -maxdepth 0 -type d | \
      sed "s|dotfiles/|$HOME/.|" | \
      xargs -I{} bash -c '([[ -e {} ]] && rm -rf {}) || true'
fi

# Copy files
find dotfiles/* -type d | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'mkdir -p {}'
find dotfiles/* -type f | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp {}'
find dotfiles/* -type l | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp -a {}'

if [ $configOnly = "false" ]; then
  install_tools
fi
