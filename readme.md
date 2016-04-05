# Bergerac
> Easy to manage dev env for OS X

:surfer: **This is just a skeleton, fork or copy this and make it your own!** :surfer:

Bergerac should be installed in the users home folder. But can be changed with `$BERGERAC_DIR` env variable.

## Prerequisites
You need CLT installed.
Run the following to install it:
```shell
$ xcode-select --install
```

## Installing
1. Clone the repository
  ```shell
  $ git clone git@github.com:USER/REPO.git ${HOME}/bergerac
  ```

2. Run `setup.sh`
  ```shell
  $ ${HOME}/bergerac/scripts/setup.sh
  ```

3. Add the following lines to your shell config file.
  ```shell
  export BERGERAC_DIR="$HOME/bergerac"
  source $HOME/bergerac/scripts/env.sh
  ```

4. Restart your shell and run `bergerac`
  ```shell
  $ bergerac
  ```

## Keep up-to-date
Run the following:
```shell
$ bergerac
```
To pull the latest changes and apply them to your system.

## License
MIT
