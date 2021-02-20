#! /usr/bin/env bash

ctrl_p() {
  filename=$(fzf)
  if [[ ! -z $filename ]]; then
    vim $filename
  fi
}

# bind ctrp-p to allow vim to fuzzy find a file
bind '"\C-p":"\eddictrl_p\r"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash 2> /dev/null

# search home directory and workspace directory for files with fzf
FZF_DEFAULT_COMMAND='ag $HOME --hidden --ignore .git -g ""'

export FZF_DEFAULT_COMMAND
