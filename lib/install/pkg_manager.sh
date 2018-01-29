source lib/detect_os.sh

function install_pkg_manager {
    case $os in
        Mac_OS_X-*)
            install_homebrew_osx
            ;;
    esac
}

function install_homebrew_osx {
    echo "=> Installing Homebrew..."
    if ! [ -x "$(command -v brew)" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "=> Homebrew is already installed"
    fi
}
