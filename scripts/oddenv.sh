#!/usr/bin/env bash

if [[ $EUID -eq 0 ]]; then
   echo "Hold your horses! I refuse to run this as root."
   exit 1
fi

if [[ "$1" = "services" ]]; then
  node $ODDENV_DIR/scripts/services.js $2 $3
  exit 0
fi

test -f "/etc/facter/facts.d/oddenv.txt" || echo oddenv_dir=$ODDENV_DIR | sudo tee -a /etc/facter/facts.d/oddenv.txt

cd $ODDENV_DIR
./scripts/satisfy.sh

# Update function
function update {
  # If not up-to-date, update!
  git checkout $1
  brew bundle check || brew bundle
  source "$(brew --prefix nvm)/nvm.sh"
  nvm which 6.7.0 || nvm install 6.7.0 && nvm alias default 6.7.0
  npm prune
  npm install
  composer install
  bundle install
  sudo puppet apply manifests

  sudo brew services restart dnsmasq
  brew services restart mysql56
}

# Get tags from master
git fetch origin master --tags >/dev/null 2>&1

# Store latest tag
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)

# Get current branch
currentBranch=$(git rev-parse --abbrev-ref HEAD)

# If on master, checkout latest tag (version)
# Probably the first time you run `oddenv`
if [ $currentBranch = "master" ]; then
  update $latestTag
  exit 0
fi

# Get the current tag and check if up-to-date
currentTag=$(git describe --tags)
if [ $currentTag = $latestTag ] && command -v node >/dev/null 2>&1 && [ "$1" != "--force" ]; then
  echo "Already up-to-date, use --force to run anyway."
  exit 0
fi

# This will run if the above fails
update $latestTag
