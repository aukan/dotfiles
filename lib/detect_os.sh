
function detect_os {
    kernel=`uname`
    case $kernel in
        Linux)
            if [[ -f /etc/os-release ]]; then
                source /etc/os-release
            fi
            os="${ID}-v${VERSION_ID}"
            ;;
        Darwin)
            os=$(sw_vers -productName | sed 's| |_|g')"-"v$(sw_vers -productVersion)
            ;;
    esac
    echo $os
}

os=$(detect_os)
