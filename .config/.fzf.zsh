# Setup fzf
# ---------
if [[ ! "$PATH" == */home/fred/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/fred/.fzf/bin"
fi

source <(fzf --zsh)
