export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:/opt/local/bin:/opt/local/sbin:$PATH

# add npm module binaries to path
export PATH=$PATH:./node_modules/.bin

# Our list of directories we can cd to from anywhere
export CDPATH=.:~/dev

# Setup terminal, and turn on colors
#
export TERM=xterm-color
export LSCOLORS=gxfxcxdxbxegedabagacad
export CLICOLOR=1

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export GIT_EDITOR="vim"
export EDITOR='vim'

ulimit -n 2048


