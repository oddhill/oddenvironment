#!/usr/bin/env bash
export BERGERAC_DIR="$HOME/bergerac"

alias bergerac="$BERGERAC_DIR/scripts/bergerac.sh"
PATH=$BERGERAC_DIR/node_modules/.bin:$BERGERAC_DIR/vendor/bin:$PATH
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
