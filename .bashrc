# ~/.bashrc: executed by bash(1) for non-login shells.

export PS1='\h:\w\$ '
umask 022
# increase history size and make history be appended
export HISTSIZE=10000
shopt -s histappend
shopt -s cdable_vars
export perf="/root/perf"
export pro="/root/dev/pythong/game/pro"
export EDITOR="/usr/bin/vim"
# this only works in terminal, in .bash_history it shows up as unix timestamp unformatted
export HISTTIMEFORMAT='%F %T '
# prevent ctrl D logout
set -o ignoreeof
set -o vi
set completion-ignore-case on
set cdable_vars
# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias tree='tree --charset=ASCII'
alias ll='ls -lh'
alias la='ls -lha'
# bindings
# bind commands
bind '"\C-e":"ls\r"'
# aliases
alias grep="grep --color=auto"
alias g='grep'
alias pgrep='pgrep -lf'
alias ahelp='apropos'
alias ..='cd ..'
alias c-='cd -'
alias reapache="/etc/init.d/apache2 restart"
# alias ls='ls -lh'
alias df='df -h'
# alias du='df -h'
# create parent directories and print out verbose
alias mkdir='mkdir -p -v'
# prevent overwrite and give a prompt
# alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# lazy git aliases
function lazygit(){
    git add .
    git commit --no-verify -m "$1"
    git push
}

# autocompletion
source /etc/bash_completion
# CDPATH=$CDPATH:~/dev/python/:~/dev/python/game
export CDPATH

# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# add golang
export PATH="/usr/local/go/bin:$PATH"
# add golang path
export GOPATH=$HOME/dev/go
# add golang bin path
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.composer/vendor/bin

export PROJECT_HOME=~/dev/python

export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # bash completion
