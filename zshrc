ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

#export PYTHONSTARTUP=$HOME/.dotfiles/pythonstartup.py
#export PYTHONPATH="/Library/Python/2.7/site-packages:$PYTHONPATH"

plugins=(git bundler brew gem rbates django osx pip)

alias sa='source pyenv/bin/activate'

export PATH="/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
