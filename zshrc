# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


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
autoload predict-on
# predict-on
bindkey -e
zle -N predict-off
zle -N predict-on
# bindkey '^X^Z' predict-on
# bindkey '^X^A' predict-off
zstyle ':predict' verbose 'yes'

export PATH="$HOME"/torch-distro/install/bin:"$HOME"/anaconda/lib:"$HOME"/anaconda/bin:/usr/local/lib:/usr/local/bin:/usr/local/sbin:"$HOME"/bin::"$HOME"/anaconda/lib:"$HOME"/anaconda/include:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Julia-0.2.0-rc2.app/Contents/Resources/julia/bin:$PATH
export PYTHONPATH="$HOME"/Code/:$PYTHONPATH
# export CC=gcc-4.9
# export CXX=g++-4.9
# `luarocks path`
export DOCKER_HOST=tcp://192.168.59.103:2375
export SPEARMINT_LOCATION=/Users/Alex/Code/Spearmint
export DOCS_LOCATION=/Users/Alex/Code/Documentation
export PYTHON_CLIENT_LOCATION=/Users/Alex/Code/Whetlab-Python-Client
export KAYAK_LOCATION=/Users/Alex/Code/Kayak
export PATH=/Developer/NVIDIA/CUDA-6.5/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.5/lib:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/lib/:/usr/local/lib/lua/5.1/:/opt/OpenBLAS/lib/
eval "$(fasd --init auto)"

autoload -U select-word-style
select-word-style bashga 

