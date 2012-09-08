function load_keys(){
  keychain ~/.ssh/id_rsa;
  source $HOME/.keychain/$HOSTNAME-sh;
}

function setup_dev_node(){
  # Check arguments are present
  if [ ${#1} -le 0 ]
  then
    echo 'You need to specify the name of the lxc container'
    return 1
  fi

  # Check lxc-container is started
  if [ $(sudo lxc-info -n $1 | grep state | grep RUNNING | wc -l) -le 0 ]
  then
    echo "Container $1 is not running."
    echo "To start it run:"
    echo ""
    echo "  \`lxc-start $1\`"
    return 1
  fi
}
