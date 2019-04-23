#! /usr/bin/env bash

# bind ctrp-p to allow vim to fuzzy find a file
bind '"\C-p":"vim `fzf`\n"'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash 2> /dev/null

# search home directory and workspace directory for files with fzf
export FZF_DEFAULT_COMMAND='ag $PROJECT --hidden --ignore .git -g "" && ag $HOME --hidden --ignore .git -g ""  '

