# Remote host utilities
# 
# Provides methods for quick access and setup of remote hosts

# Installs your public key on a remote host
function grant_access {
  SSH_HOST=$1

  auth_file='$HOME/.ssh/authorized_keys'
  public_key=`cat ~/.ssh/id_rsa.pub`
  command="

  echo '.. Making sure .ssh directory exists with the right permissions';
  mkdir -p \$HOME/.ssh;
  chmod 700 \$HOME/.ssh;

  if [[ -f $auth_file ]];
  then
    if [[ \`cat $auth_file\` =~ '$public_key' ]];
    then
      echo -e \"\e[01;33m.. Your key is already installed.\e[00m\";
    else
      echo '$public_key' >> $auth_file;
      echo -e \"\e[00;32m.. Your key has been added to existing authorized_keys file..\e[00m\";
    fi
  else
    echo -e \"\e[00;32m.. Creating authorized_keys with your key..\e[00m\";
    echo '$public_key' > $auth_file;
  fi;

  echo '.. Setting correct file permissions for authorized_keys';
  chmod 600 $auth_file
  "
  ssh $SSH_HOST $command
}

# Installs your working keys on another computer
function install_keys {
  SSH_HOST=$1

  private_path='$HOME/.ssh/id_rsa'
  public_path='$HOME/.ssh/id_rsa.pub'

  # make sure .ssh exists
  ssh $SSH_HOST 'mkdir -p $HOME/.ssh && chmod 700 $HOME/.ssh'

  # copy files
  scp -r ~/.ssh/id_rsa "$SSH_HOST:\$HOME/.ssh/"
  scp -r ~/.ssh/id_rsa.pub "$SSH_HOST:\$HOME/.ssh/"
}

# Installs current dotfiles
function install_dotfiles {
  SSH_HOST=$1

  scp -r ~/.dotfiles "$SSH_HOST:\$HOME/"
  ssh $SSH_HOST 'cd $HOME/.dotfiles && ./install'
}
