source lib/detect_os.sh

function install_spacevim {
    case $os in
        Mac_OS_X-*)
            install_spacevim_osx
            ;;
    esac
}

function install_spacevim_osx {
    echo "=> Installing Spacevim..."
    curl -sLf https://spacevim.org/install.sh | bash
}
