# Bergerac
> Easy to manage dev env for OS X

## Prerequisites
You need CLT installed.
Run the following to install it:
```shell
$ xcode-select --install
```

## Installing
1. Clone the repository
  ```shell
  $ git clone git@github.com:jenslind/bergerac.git ${HOME}/bergerac
  ```

2. Run `setup.sh`
  ```shell
  $ ${HOME}/bergerac/setup.sh
  ```

3. Add `env.sh` to your shell config file.
  Add the following line at the bottom of your config file.
  ```shell
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
