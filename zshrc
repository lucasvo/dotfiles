ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

#export PYTHONSTARTUP=$HOME/.dotfiles/pythonstartup.py
#export PYTHONPATH="/Library/Python/2.7/site-packages:$PYTHONPATH"

plugins=(git bundler brew gem rbates django osx pip)

export PATH="/usr/local/bin:$PATH"
export DYLD_LIBRARY_PATH=:/usr/local/mysql-5.5.15-osx10.6-x86_64/lib

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ZSH outputs errors for the ls * command if you don't disable the nomatch output
function auto_activate {
SEARCHPATH=`pwd`

function activate_env {
    unsetopt nomatch 2>/dev/null

    ls $SEARCHPATH/*/bin/activate > /dev/null 2> /dev/null
    if [ "$?" = '0' ]; then
      deactivate > /dev/null 2> /dev/null
      source $SEARCHPATH/*/bin/activate
      return
    else
      SEARCHPATH=$(dirname "$SEARCHPATH")
      if [ "$SEARCHPATH" = "/" ]; then
        return
      fi
      activate_env
      return $?
    fi
}

unset $SEARCHPATH

activate_env
setopt nomatch 

}

auto_activate

alias autoactivate="auto_activate"


alias pipr="pip install -r requirements.txt"
