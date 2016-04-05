#!/usr/bin/env bash
source "$(brew --prefix nvm)/nvm.sh"

cd $HOME/bergerac
git pull
brew bundle check || brew bundle
nvm which 5.0 || nvm install 5.0
npm install
composer install
bundle install
sudo puppet apply site.pp
