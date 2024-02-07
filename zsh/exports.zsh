# add libpq for pg gem
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# add docker
export PATH="/users/tdavies/.docker/bin:$PATH"

# Our list of directories we can cd to from anywhere
export CDPATH=.:~/code

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
export THOR_MERGE='gvimdiff'

# Never update homebrew packages automatically
export HOMEBREW_NO_AUTO_UPDATE="1"

ulimit -n 2048
