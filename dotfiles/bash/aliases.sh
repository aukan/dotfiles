# Load aliases from directory
source ~/.bash/aliases/*.sh

# system
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias search='sudo apt-cache search'

# edit bash configuration
alias bashrc='vim ~/.bashrc'

# cd
alias ..='cd ..'
alias _='cd -'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
# submodules
alias gsu='git submodule update'

# rails
alias sc='script/console'
alias ss='script/server'
alias sg='script/generate'
alias a='autotest -rails'
alias tlog='tail -f log/development.log'

# misc
alias reload='. ~/.bash_profile'

# VirtualBox
alias vboxm=VBoxManage

# Keychain
alias keys=load_keys
