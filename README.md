# dotfiles

This repo is about dotfiles to reinstall my PC efficiently.

This is made for Ubuntu Linux distribution but it can be also used on other Unix based systems. It's not garanteed to work the same.

This readme assume you are familiar with basic linux command line usage.

## Easy install

```shell
wget -O - https://raw.githubusercontent.com/qroques/dotfiles/master/prerequisites/install.sh | bash
```

## Pre-requisites

Make sure you have the following installed before following the installation steps:

<details>
<summary>Git</summary>

Install git:

```shell
sudo apt -y install git
```

</details>

<details>
<summary>Make</summary>

Depending on the Linux distribution this may require to install `make`

To know if `make` is installed:

```shell
make --version
```

If not, install it:

```shell
sudo apt install make
```

</details>

## Install

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

Magic install:

```shell
make install
```

## Credits

This is an adaptation of [lcouellan](https://github.com/lcouellan/) [dotfiles project](https://github.com/lcouellan/dotfiles)
