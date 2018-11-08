source lib/detect_os.sh

function install_vim {
    case $os in
        debian-v*)
            install_vim_debian
            ;;
        ubuntu-v*)
            install_vim_debian
            ;;
        Mac_OS_X-*)
            install_vim_osx
            ;;
    esac
}

function install_vim_debian {
    echo "=> Installing Vim..."
    su root -c "apt-get install -y language-pack-en language-pack-es vim-nox"
    vim +PluginInstall +qall
}

function install_vim_osx {
    echo "=> Installing Vim..."
    brew install vim
}
