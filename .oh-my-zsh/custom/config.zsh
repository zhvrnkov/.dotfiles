ZSH_THEME="custom_bureau"
ENABLE_CORRECTION="true"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -nw'
else
  export EDITOR='emacs -nw'
fi
