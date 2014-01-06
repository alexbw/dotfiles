# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source $HOME/.yadr/zsh/alex.zsh
source $HOME/.yadr/zsh/aliases.zsh
source $HOME/.yadr/zsh/colors.zsh
source $HOME/.yadr/zsh/fasd.zsh
source $HOME/.yadr/zsh/key-bindings.zsh
source $HOME/.yadr/zsh/last-command.zsh
source $HOME/.yadr/zsh/rm.zsh
source $HOME/.yadr/zsh/vi-mode.zsh
source $HOME/.yadr/zsh/zmv.zsh
source $HOME/.yadr/zsh/zsh-aliases.zsh
source $HOME/.yadr/zsh/zsh-aliases.zsh

autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^X^A' predict-off
zstyle ':predict' verbose 'yes'

export PATH="$HOME"/anaconda/bin:/usr/local/bin:/usr/local/sbin:"$HOME"/bin::"$HOME"/anaconda/lib:"$HOME"/anaconda/include:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Julia-0.2.0-rc2.app/Contents/Resources/julia/bin:$PATH
export PYTHONPATH=/Users/Alex/Code/:$PYTHONPATH
export CC=clang
export CXX=clang

eval "$(fasd --init auto)"
source ~/.autoenv/activate.sh

unalias rm

autoload -U select-word-style
select-word-style bashga 