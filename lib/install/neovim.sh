source lib/detect_os.sh

function install_neovim {
    case $os in
        Mac_OS_X-*)
            install_neovim_osx
            ;;
    esac
}

function install_neovim_osx {
    gjf="https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar"

    echo "=> Installing Neovim..."

    # Prerequisites
    brew install python
    brew install python3
    pip2 install neovim --upgrade
    pip3 install neovim --upgrade
    pip3 install pynvim --upgrade
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    mkdir -p ~/.local/share/gjf && wget -O ~/.local/share/gjf/google-java-format-all-deps.jar $gjf

    brew install neovim
    ln -s /usr/local/bin/nvim /usr/local/bin/vim
    nvim +PlugInstall +qall
}
