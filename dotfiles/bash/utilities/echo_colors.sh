# Print as red error
function echo_error {
  echo -e "\e[00;31m$1\e[00m"
}

function echo_warning {
  echo -e "\e[01;33m$1\e[00m"
}

function echo_success {
  echo -e "\e[00;32m$1\e[00m"
}
