#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.scm_breeze/scm_breeze.sh ]] && source $HOME/.scm_breeze/scm_breeze.sh

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin
export PATH=$PATH:/usr/local/Cellar/ruby/2.0.0-p247/bin
export PATH=$PATH:~/bin

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set my editor and git editor
export EDITOR="/usr/bin/vim"
export GIT_EDITOR="/usr/bin/vim"

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Dont check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.

export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli

export TODO="t"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

alias fe="cd ~/code/DSP-Frontend"
alias be="cd ~/code/DSP-Backend/core"
alias db="cd ~/code/common/common-database"
alias ui="cd ~/code/tapad-ui-framework"
alias dg="cd ~/code/ui-DGA"
alias aa="cd ~/code/ui-audience-amplify"
alias dm="cd ~/code/ui-dataflow-management"
alias ds="cd ~/code/ui-dsp"
alias te="cd ~/code/tapad-test-framework"
alias ts="cd ~/code/data-shipment"

alias tap="cd ~/code/data-shipment"
alias dga="cd ~/code/ui-DGA"
alias dsp="cd ~/code/ui-dsp"

alias lgrep="grep -inlrI"
alias la="ls -ltrhA"
alias rgrep="grep -inrI"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=/Users/david/.rvm/gems/ruby-2.1.2/bin:$PATH

export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/dnewell/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# this step is optional is required only if your local username is not same as your VPN login (linux_system_login_name).
export HADOOP_USER_NAME=dnewell
 
export HADOOP_HOME_CDH5=$HOME/opt/hadoop-2.3.0-cdh5.0.1
export HADOOP_HOME=$HADOOP_HOME_CDH5
  
export OOZIE_HOME_CDH5=$HOME/opt/oozie-4.0.0-cdh5.0.1
export OOZIE_HOME_CDH531=$HOME/opt/oozie-4.0.0-cdh5.3.1
export OOZIE_HOME=$OOZIE_HOME_CDH5
  
export OOZIE_TIMEZONE=UTC
export OOZIE_URL=http://namenode001.prd.nj1.tapad.com:11000/oozie/
 
# start ------- new hadoop & oozie launchers --------------
hadoop_nj1() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  $HADOOP_HOME/bin/hadoop "$@"
}
 
hadoop_am1() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  $HADOOP_HOME/bin/hadoop --config "${HADOOP_HOME_CDH5}/etc/hadoop_am1" "$@"
}
 
hadoop_stg() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  $HADOOP_HOME/bin/hadoop --config "${HADOOP_HOME_CDH5}/etc/hadoop_stg" "$@"
}
 
oozie_nj1() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  export OOZIE_HOME=$OOZIE_HOME_CDH5
  export OOZIE_URL=http://namenode001.prd.nj1.tapad.com:11000/oozie/
  $OOZIE_HOME/bin/oozie "$@"
}
 
oozie_am1() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  export OOZIE_HOME=$OOZIE_HOME_CDH531
  export OOZIE_URL=http://namenode001.prd.am1.tapad.com:11000/oozie/
  $OOZIE_HOME/bin/oozie "$@"
}
 
oozie_stg() {
  export HADOOP_HOME=$HADOOP_HOME_CDH5
  export OOZIE_HOME=$OOZIE_HOME_CDH5
  export OOZIE_URL=http://namenode001.stg.nj1.tapad.com:11000/oozie/
  $OOZIE_HOME/bin/oozie "$@"
}
 
hadoop() {
  local cluster=$1
  case $cluster in
    nj1|am1|stg)
      echo "Using $cluster cluster"
      shift
      hadoop_$cluster "$@"
      ;;
    *)
      echo 'Unknown cluster requested, defaulting to nj1'
      hadoop_nj1 "$@"
      ;;
  esac
}
 
oozie() {
  local cluster=$1
  case $cluster in
    nj1|am1|stg)
      echo "Using $cluster cluster"
      shift
      oozie_$cluster "$@"
      ;;
    *)
      echo 'Unknown cluster requested, defaulting to nj1'
      oozie_nj1 "$@"
      ;;
  esac
}
 
yarn() {
  $HADOOP_HOME/bin/yarn "$@"
}
 
export -f hadoop_nj1
export -f hadoop_am1
export -f hadoop_stg
export -f hadoop_sg1
 
export -f oozie_nj1
export -f oozie_am1
export -f oozie_stg
export -f oozie_sg1
 
export -f hadoop
export -f oozie
# end ------- new hadoop & oozie launchers --------------
 
function hue_coord() {
  open http://namenode001.prd.nj1.tapad.com:8888/oozie/list_oozie_coordinator/$1/
}
function hue_wf() {
  open http://namenode001.prd.nj1.tapad.com:8888/oozie/list_oozie_workflow/$1//
}
function hue_hdfs() {
  open http://namenode001.prd.nj1.tapad.com:8888/filebrowser/#$1
}

source ~/.xsh
