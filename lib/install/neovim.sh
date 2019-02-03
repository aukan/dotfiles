source lib/detect_os.sh

function install_neovim {
    case $os in
        Mac_OS_X-*)
            install_neovim_osx
            ;;
    esac
}

function install_neovim_osx {
    echo "=> Installing Neovim..."

    # Prerequisites
    brew install python
    brew install python3
    pip2 install neovim --upgrade
    pip3 install neovim --upgrade
    pip3 install pynvim --upgrade
    brew install fzf
    $(brew --prefix)/opt/fzf/install

    brew install neovim
    ln -s /usr/local/bin/nvim /usr/local/bin/vim
    nvim +PlugInstall +qall
}
