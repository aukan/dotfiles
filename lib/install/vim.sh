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
    gjf="https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar"

    echo "=> Installing Vim..."

    # Prerequisites
    brew install python
    brew install python3
    pip3 install pynvim --upgrade
    brew install fzf
    $(brew --prefix)/opt/fzf/install
    if [ -z ~/.local/share/gjf/google-java-format-all-deps.jar ]; then
      mkdir -p ~/.local/share/gjf && wget -O ~/.local/share/gjf/google-java-format-all-deps.jar $gjf
    fi

    # Plugin Manager
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    alias python=python3
    brew install vim
    unalias python
    vim +PlugInstall +qall
}
