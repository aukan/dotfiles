source lib/detect_os.sh

function install_git {
    case $os in
        debian-v*)
            install_git_debian
            configure_git_user
            ;;
        ubuntu-v*)
            install_git_debian
            configure_git_user
            ;;
    esac
}

function install_git_debian {
    echo "Installing git..."
    su root -c "apt-get update"
    su root -c "apt-get install -y git"
}

function install_git_osx {
    echo "Installing git..."
    brew install git
}

function configure_git_user {
    echo "Please enter git user's name: "
    read -e gituser
    git config --global user.name $gituser

    echo "Please enter git user's email: "
    read -e gitemail
    git config --global user.email $gitemail
}
