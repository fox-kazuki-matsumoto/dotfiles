PS1="\[\033[33;40m\]\W\[\033[0m\] \[\033[36m\]>\[\033[0m\] "
export PATH=$HOME/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew

export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# php
export PATH="/usr/local/opt/php@7.0/bin:$PATH"

# ruby
# RSPEC_PATH=$(find /usr/local/Cellar/rspec -name "exe" | tr '\012' ":" | sed 's/:$//g')
# RSPEC_RUBYLIB=$(find /usr/local/Cellar/rspec -name "lib" | tr '\012' ":" | sed 's/:$//g')

export PATH=$PATH:$RSPEC_PATH
export RUBYLIB=$RUBYLIB:$RSPEC_RUBYLIB


if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
