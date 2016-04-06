#!/usr/bin/env bash
brew --version || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sudo mkdir -p /etc/facter/facts.d
sudo touch /etc/facter/facts.d/env.txt
echo home=$HOME | sudo tee -a /etc/facter/facts.d/env.txt
echo user=$USER | sudo tee -a /etc/facter/facts.d/env.txt