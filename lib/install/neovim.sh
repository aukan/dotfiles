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
    brew install neovim
}
