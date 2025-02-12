# dotfiles

This repo is about dotfiles to reinstall my PC efficiently.

This is made for **Ubuntu Linux** distribution. It's not garanteed to work the same.

This readme assume you are familiar with basic linux command line usage.

## Easy install

```shell
wget -O - https://raw.githubusercontent.com/qroques/dotfiles/master/prerequisites/install.sh | bash
```

## Auto install

```shell
wget -O - https://raw.githubusercontent.com/qroques/dotfiles/master/prerequisites/install.sh | bash
```

This script will :

- Install `git` ;
- Install `make` ;
- Clone the repository into your home directory (as `dotfiles`) ;
- Run the install process ;

## Manual Install

If you already have `git` and `make` installed, you can clone the repository and run the install process manually.

On your fresh Ubuntu Linux installation:

Clone the repository:

```shell
git clone https://github.com/qroques/dotfiles ~/dotfiles
```

Or alternatively, fork the repository to make you own.

```shell
cd ~/dotfiles
```

> **Note**
> If you are not [@qroques](github.com/qroques), you may want to change the git configuration to your own. To do so, modify the file `./git/config` with something like:

```config
[user]
	name = Your Name
	email = your.name@knplabs.com
```

then, run the install process:

```shell
make install
```

## Credits

This is an adaptation of [lcouellan](https://github.com/lcouellan/) [dotfiles project](https://github.com/lcouellan/dotfiles)
