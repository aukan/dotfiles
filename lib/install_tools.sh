source lib/detect_os.sh

function install_tools {
    case $os in
        debian-v*|ubuntu-v*)
            install_tools_debian
            ;;
        Mac_OS_X-*)
            install_tools_osx
            ;;
    esac
}

function install_tools_debian {
    echo "=> Installing Tools..."

    su root -c "apt-get update"

    # Git, Vim, Tmux
    su root -c "apt-get install -y git language-pack-en language-pack-es vim-nox tmux"
    vim +PluginInstall +qall
}

function install_tools_osx {
    echo "=> Installing Tools..."

    # Brew
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Prerequisites
    alias python=python3
    brew bundle --file=- <<-EOS
brew "git"
brew "python"
brew "python3"
brew "fzf"
brew "google-java-format"
brew "vim"
brew "nvim"
brew "universal-ctags/universal-ctags/universal-ctags", args: ['HEAD']
EOS
    unalias python
    $(brew --prefix)/opt/fzf/install

    # pip
    pip2 install neovim --upgrade
    pip3 install neovim --upgrade

    # Vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim # Plugin manager
    vim +PlugInstall +qall

    # Neovim
    mkdir -p ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
    ln -s ~/.vim/ftplugin ~/.config/nvim/ftplugin
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +qall

    # Tmux 
    if ! [ -x "$(command -v tmux)" ]; then
        brew install tmux
    else
        echo "=> Tmux is already installed"
    fi
}
