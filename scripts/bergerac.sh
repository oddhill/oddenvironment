#!/usr/bin/env bash

cd $BERGERAC_DIR
git pull
brew bundle check || brew bundle
source "$(brew --prefix nvm)/nvm.sh"
nvm which 5.0 || nvm install 5.0
npm install
composer install
bundle install
sudo puppet apply site.pp
