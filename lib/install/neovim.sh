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
    pip5 install neovim --upgrade

    echo "let g:python2_host_prog = '/usr/local/bin/python'" >> ~/.config/nvim/init.vim
    echo "let g:python3_host_prog = '/usr/local/bin/python3'" >> ~/.config/nvim/init.vim

    brew install neovim/neovim/neovim
}
