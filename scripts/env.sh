#!/usr/bin/env bash
alias oddenv="$ODDENV_DIR/scripts/oddenv.sh"
PATH=$ODDENV_DIR/node_modules/.bin:$ODDENV_DIR/vendor/bin:$PATH
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
export NODE_PATH=`npm root -g`
