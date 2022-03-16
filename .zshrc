source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/history.zsh
source ~/.zsh/edit_command_line.zsh
source ~/.zsh/zsh_hooks.zsh
source ~/.zsh/rake_completion.zsh
source ~/.zsh/bundle_exec.zsh
source ~/.zsh/zmv.zsh
source ~/.env

eval "$(/opt/homebrew/bin/brew shellenv)"

. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
