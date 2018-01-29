source lib/detect_os.sh

function install_ctags {
    case $os in
        debian-v*)
            install_ctags_debian
            ;;
        ubuntu-v*)
            install_ctags_debian
            ;;
        Mac_OS_X-*)
            install_ctags_osx
            ;;
    esac
}

function install_ctags_debian {
    echo "Installing ctags..."
    su root -c "apt-get update"
    su root -c "apt-get install -y exuberant-ctags"
}

function install_ctags_osx {
    echo "Installing ctags..."
    brew install ctags-exuberant
}
