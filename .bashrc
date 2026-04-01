# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.ssh/ssh_start.sh
export EDITOR=nvim
export VIRTUAL_ENV_DIR=~/.virtualenvs
