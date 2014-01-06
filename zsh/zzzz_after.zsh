# Load any custom after code
if [ -d $HOME/.zsh.after/ ]; then
  if [ "$(ls -A $HOME/.zsh.after/)" ]; then
    for config_file ($HOME/.zsh.after/*.zsh) source $config_file
  fi
fi


autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey '^X^Z' predict-on
bindkey '^X^A' predict-off
zstyle ':predict' verbose 'yes'

export PATH="$HOME"/anaconda/bin:/usr/local/bin:/usr/local/sbin:"$HOME"/bin::"$HOME"/anaconda/lib:"$HOME"/anaconda/include:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Julia-0.2.0-rc2.app/Contents/Resources/julia/bin:$PATH
export PYTHONPATH="$PYTHONPATH":/Users/Alex/Code/:"$HOME"/.starcluster/plugins:/Users/Alex/Code/luigi/:$PYTHONPATH
export CC=clang
export CXX=clang
 
source ~/.yadr/zsh/aliases.zsh

eval "$(fasd --init auto)"
source ~/.autoenv/activate.sh

unalias rm

autoload -U select-word-style
select-word-style bashga 
