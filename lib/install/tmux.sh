source lib/detect_os.sh

function install_tmux {
    case $os in
        debian-v*)
            install_tmux_debian
            ;;
        ubuntu-v*)
            install_tmux_debian
            ;;
        Mac_OS_X-*)
            install_tmux_osx
            ;;
    esac
}

function install_tmux_debian {
    echo "=> Installing Tmux..."
    su root -c "apt-get install -y tmux"
}

function install_tmux_osx {
    echo "=> Installing Tmux..."
    if ! [ -x "$(command -v tmux)" ]; then
        brew install tmux
    else
        echo "=> Tmux is already installed"
    fi
}
