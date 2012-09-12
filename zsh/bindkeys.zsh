
# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey -v

bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^F"      history-incremental-search-forward   # ctrl-f
bindkey "^A"      beginning-of-line                    # ctrl-a
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "^N"      history-search-forward               # ctrl-n
bindkey "^P"      history-search-backward              # ctrl-p
bindkey 'jj'      vi-cmd-mode                          # jj maps to vi cmd mode
