export ZSH="$HOME/.oh-my-zsh"
export VISUAL='emacsclient -ca emacs'
export EDITOR="$VISUAL"

CASE_SENSITIVE="true"
ZSH_THEME="custom_bureau"
ENABLE_CORRECTION="true"

zstyle ":completion:*" matcher-list ''

plugins=(git)
source $ZSH/oh-my-zsh.sh

x-copy-region-as-kill () {
  zle copy-region-as-kill
  print -rn $CUTBUFFER | xsel -i -b
}
zle -N x-copy-region-as-kill
x-kill-region () {
  zle kill-region
  print -rn $CUTBUFFER | xsel -i -b
}
zle -N x-kill-region
x-yank () {
  CUTBUFFER=$(xsel -o -b </dev/null)
  zle yank
}
zle -N x-yank
bindkey -e '\ew' x-copy-region-as-kill
bindkey -e '^W' x-kill-region
bindkey -e '^Y' x-yank
