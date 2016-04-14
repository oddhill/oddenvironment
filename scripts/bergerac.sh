#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
   echo "Hold your horses! I refuse to run this as root."
   exit 1
fi

cd $BERGERAC_DIR
git pull
brew bundle check || brew bundle
source "$(brew --prefix nvm)/nvm.sh"
nvm which 5.0 || nvm install 5.0
npm install
composer install
bundle install
sudo puppet apply manifests

sudo brew services restart dnsmasq
brew services restart mysql56
