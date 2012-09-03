function load_keys(){
  keychain ~/.ssh/id_rsa;
  source $HOME/.keychain/$HOSTNAME-sh;
}

function setup_dev_node(){
  # Check lxc-container is started
  if[[ $(sudo lxc-info -n $1 | grep state | grep RUNNING | wc -l) -ge 1 ]] then
    echo "is running"
  else
    echo "is not..."
  fi
}
