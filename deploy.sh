#!/bin/sh

# FIXME
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

cd ${DOT_DIRECTORY}

for f in .??*
do
  # 無視したいファイル,ディレクトリ
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)

