# Odd Environment
> Easy to manage dev env for OS X

## Prerequisites
1. You need CLT installed. Run the following to install it:
  ```shell
  $ xcode-select --install
  ```

2. Make sure that Odd Boxen is completely removed if you've been using that previously. Please read [Migrating from Odd Boxen](#migrating-from-odd-boxen) for further details.

## Installing
1. Clone the repository
  ```shell
  $ git clone https://github.com/oddhill/oddenvironment.git ${HOME}/oddenv
  ```

2. Copy auth.pp.default to auth.pp and enter auth credentials for Sendgrid.
  ```shell
  $ cp ${HOME}/oddenv/manifests/auth.pp.default ${HOME}/oddenv/manifests/auth.pp
  ```

3. Run `setup.sh`
  ```shell
  $ ${HOME}/oddenv/scripts/setup.sh
  ```

4. Add the following lines to your shell config file. (.profile or .bash_profile in your home folder)
  ```shell
  export ODDENV_DIR="$HOME/oddenv"
  source $ODDENV_DIR/scripts/env.sh
  ```

5. Restart your shell and run `oddenv` in order to install everything
  ```shell
  $ oddenv --force
  ```

## Keep up-to-date
Run the following:
```shell
$ oddenv
```
To pull the latest changes and apply them to your system.

## Services

```shell
$ oddenv services list
$ oddenv services mysql restart
$ oddenv services apache stop
```

`oddenv services` is just a wrapper around other commands.
So `brew services` might be worth checking out. :)

```shell
$ brew services list
$ brew services restart mysql56
```

## Logging

Logs for every service is available at */usr/local/var/log*. Simply browse that directory in order to find what you need.

## Migrating from Odd Boxen

### Backup everything that you might need

- **MySQL databases**. Run this command to dump every database and the contents to the desktop:
```shell
$ mysqldump -u root -h 127.0.0.1 --all-databases > ~/Desktop/databases.sql
```
- **Homebrew packages**. You probably know if you've installed some additional package manually, but you can run the following command to get a list of what you've installed. Write them down and install them manually again after you've installed Odd Environment.
```shell
$ brew list
```
- **Node packages**. Same goes here, you'll need to install your manually installed packages afterwards. Use this command to see a list of the global packages currently installed:
```shell
$ npm -g list
```

### Delete every trace of Odd Boxen

1. Run the following commands, one at a time:
```shell
$ cd /opt/boxen/repo
$ script/nuke --all --force
$ cd
$ rm -r ~/src/
$ for i in `gem list --no-versions`; do sudo gem uninstall -aIx $i; done
```
2. Edit `~/.profile` and remove the line that says `source /opt/boxen/env.sh`.
3. Remove any applications from `~/Applications` that has been installed by Homebrew Cask. You want to delete the ones that are symlinks, and keep the rest.
4. Reboot (just for the sake of it)
5. Done!

### Make sure that Homebrew has been removed
Some users have experienced problems after Odd Boxen was removed which all has been releated to traces of Homebrew that wasn't removed properly.

Make sure that homebrew doesn't existing by running `brew`. If the command still works, you will need to uninstall it manually by running `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"`.

### After installation of Odd Environment

1. Import your databases again:
```shell
$ mysql < ~/Desktop/databases.sql
```
2. Install any additional Homebrew package that you might still need, but isn't included in Odd Environment...
3. ... and do the same for Node packages.



## License
MIT
