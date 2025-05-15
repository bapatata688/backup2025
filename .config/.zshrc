#source ~/powerlevel10k/powerlevel10k.zsh-theme
ENABLE_CORRECTION="true"
zstyle ':omz:update' mode auto
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=500
SAVEHIST=500
export TERM=xterm-256color
function fzf-lovely(){
	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

autoload -U compinit; compinit
bindkey -v
export KEYTIMEOUT=1

source ~/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/fred/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#alias

server() {
  echo "Iniciando servidor HTTP en http://localhost:8080"
  python3 -m http.server 8080 &
  HTTP_PID=$!
  echo "Iniciando livereload en http://localhost:35729"
  livereload . &
  LR_PID=$!
  echo "Presiona Ctrl+C para detener ambos procesos"
  wait $HTTP_PID $LR_PID
}
alias rww='pkill waybar && waybar &'
alias ghostty-c='nvim ~/.config/ghostty/config'
alias power-p='powerprofilesctl set performance'
eval "$(zoxide init zsh)"
alias zsh-c='nvim ~/.zshrc'
alias zsh-r='source ~/.zshrc'
alias cd="z"
alias ml4w-sh='nvim ~/.config/ml4w/scripts/'
alias hypr-c='nvim ~/.config/hypr/'
alias eye-care='wlsunset -t 4100 T 4500 -S 7:00 -s 20:00 -d 1800 &'

#git coding
alias ssh-s='eval "$(ssh-agent  -s)"'
#git coding

alias nf='neofetch'
alias ff='fastfetch'
alias ls='exa --group-directories-first --icons=always'
alias lsd='exa -a --group-directories-first --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'
alias v='vim' 
alias nv='nvim'
alias ts='~/.config/ml4w/scripts/snapshot.sh'
alias wifi-r='NetworkManager restart'
alias ascii='~/.config/ml4w/scripts/figlet.sh'
#alias hypr-config='ghostty -e nvim ~/.config/hypr/'
alias tmux-c='nvim .tmux.conf'
#export TERM="xterm-256color"
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias nvim-c='nvim ~/.config/nvim/'

alias tmux-k='tmux kill-server'

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2

# thefuck a

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"


export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"


export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}


alias tmux-r='tmux source .tmux.conf'
tmux-switch() {
  local session=$(tmux list-sessions -F "#{session_name}" | fzf)
  [ -n "$session" ] && tmux switch-client -t "$session"
}
export BAT_THEME=tokynight
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
source ~/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.local/bin:$PATH"
