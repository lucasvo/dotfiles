ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

#export PYTHONSTARTUP=$HOME/.dotfiles/pythonstartup.py
#export PYTHONPATH="/Library/Python/2.7/site-packages:$PYTHONPATH"

plugins=(git github bundler brew gem rbates django osx pip cake)

export PATH="/usr/local/bin:$PATH"

# added by Anaconda 1.6.1 installer
export PATH="/Users/lucasvo/anaconda/bin:$PATH"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:/opt/local/lib:/usr/local/Cellar/openssl/1.0.1e/lib:$DYLD_LIBRARY_PATH

source $ZSH/oh-my-zsh.sh

source /Library/PostgreSQL/9.2/pg_env.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

setopt append_history no_inc_append_history no_share_history

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

alias tmux="TERM=xterm-256color tmux"

function imux {
    tmux ls
    read "session?Session: "
    tmux attach -t $session
  }

alias t=imux
alias autoactivate="auto_activate"
alias aa="autoactivate"

alias gc="git commit -m"

alias fact="elinks -dump http://randomfunfacts.com  | sed -n '/^| /p' | tr -d \|"

alias pipr="pip install -r requirements.txt --upgrade"

export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
