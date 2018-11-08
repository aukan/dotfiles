#!/bin/bash

# Source files
for f in lib/install/*.sh; do source $f; done

# Script that installs the dotfiles
#
# It creates symlinks to the files contained in
# the source directory

# Set current directory
BASE_DIR=$(dirname $BASH_SOURCE)
cd $BASE_DIR

# Install prerequisites
install_pkg_manager
install_git

# Initialize
git submodule init
git submodule update

# Clean directories
find dotfiles/* -maxdepth 0 -type d | \
    sed "s|dotfiles/|$HOME/.|" | \
    xargs -I{} bash -c '([[ -e {} ]] && rm -rf {}) || true'

# Install tools
install_vim
install_spacevim
install_tmux
install_ctags

# Copy files
find dotfiles/* -type d -maxdepth 0 | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp -rf {}'
find dotfiles/* -type f -maxdepth 0 | sed "s|dotfiles\/|{$BASE_DIR\/dotfiles\/,$HOME\/.}|" | xargs -I{} bash -c 'cp {}'

