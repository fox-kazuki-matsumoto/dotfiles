PS1="\[\033[33;40m\]\W\[\033[0m\] \[\033[36m\]>\[\033[0m\] "
export PATH=$HOME/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# php
export PATH="/usr/local/opt/php@7.0/bin:$PATH"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
