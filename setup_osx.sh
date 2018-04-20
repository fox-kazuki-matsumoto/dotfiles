#!/bin/bash

### special thanks...
### @see http://qiita.com/kibitan/items/d564248eeaebbf003edc
### execute this command
### chmod +x setup_osx.sh
### ./setup_osx.sh

ask() {
  printf "$* [y/n] "
  local answer
  read answer

  case $answer in
    "yes" ) return 0 ;;
    "y" )   return 0 ;;
    * )     return 1 ;;
  esac
}

set -e

## install brew
if ask 'Homebrew install?'; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew doctor
  brew install caskroom/cask/brew-cask
fi

if ask 'git install?'; then
  brew doctor
  brew update
  brew install git
fi

if ask 'tig install?'; then
  brew install tig
fi

if ask 'Alfred install?'; then
  brew cask install alfred
fi

if ask 'clipy install?'; then
  brew cask install clipy
fi

## mac setting
if ask "set 'locate' command?"; then
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist
fi

if ask 'set visible dotfiles in finder?'; then
  defaults write com.apple.finder AppleShowAllFiles TRUE
  killall Finder
fi

if ask 'set fullpath title at finder?'; then
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool yes
  killall Finder
fi

if ask 'set always expand save dialog?'; then
  defaults write -g NSNavPanelExpandedStateForSaveMode -bool yes
fi

if ask 'set mute in mac booting sound?'; then
  sudo nvram SystemAudioVolume=%80
fi

# @see https://discussionsjapan.apple.com/thread/10153604
if ask 'set clamshell mode off? (for multi display sleep)'; then
  sudo nvram boot-args="niog=1"
fi

printf 'All setup is finished'
