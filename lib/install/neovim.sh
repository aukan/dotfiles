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
    brew install python
    brew install python3
    pip2 install neovim --upgrade
    pip3 install neovim --upgrade

    brew install neovim
}
