#!/bin/bash

set -eu

# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/m4ppi/dotfiles.git"
REMOTE_URL="git@github.com:m4ppi/dotfiles.git"
# if directory does not exist
if [ ! -d ${DOT_DIRECTORY} ]; then
    echo "Downloading dotfiles..."
    mkdir ${DTO_DIRECTORY}

    if type "git" > /dev/null 2>&1; then
        git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
    else
        curl -fsSlo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
        tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
        rm -f ${HOME}/dotfiles.tar.gz
    fi

    echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

# コマンドの存在確認
# has() {
  # type "$1" > /dev/null 2>&1
# }
# if has "brew"; then
  # ...
# fi

cd $THIS_DIR
git submodule init
git submodule update

echo "start setup..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".require_oh-my-zsh" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

[ -e ~/.gitconfig.local ] || cp ~/dotfiles/.gitconfig.local.template ~/.gitconfig.local

# emacs set up
if which cask >/dev/null 2>&1; then
  echo "setup .emacs.d..."
  cd ${THIS_DIR}/.emacs.d
  cask upgrade
  cask install
fi

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
