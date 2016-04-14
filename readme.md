# Oddenvironment
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
  $ git clone https://github.com/oddhill/oddenvironment.git ${HOME}/bergerac
  ```
2. Copy auth.pp.default to auth.pp and enter auth credentials for Sendgrid.
  ```shell
  $ cp ${HOME}/bergerac/manifests/auth.pp.default ${HOME}/bergerac/manifests/auth.pp
  ```


3. Run `setup.sh`
  ```shell
  $ ${HOME}/bergerac/scripts/setup.sh
  ```

4. Add the following lines to your shell config file.
  ```shell
  export BERGERAC_DIR="$HOME/bergerac"
  source $HOME/bergerac/scripts/env.sh
  alias oddenv=bergerac
  ```

5. Restart your shell and run `oddenv`
  ```shell
  $ oddenv
  ```

## Keep up-to-date
Run the following:
```shell
$ oddenv
```
To pull the latest changes and apply them to your system.

## License
MIT
