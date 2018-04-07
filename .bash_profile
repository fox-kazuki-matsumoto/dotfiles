if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PS1="\[\033[33;40m\]\W\[\033[0m\] \[\033[36m\]>\[\033[0m\] "
export PATH=$HOME/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
