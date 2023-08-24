# dotfiles

This repo is about dotfiles to reinstall m'y PC efficiently.

This is made for Ubuntu Linux distribution but it can be also used on other Unix based systems. It's not garanteed to work the same.

This readme assumed you are familiar with basic linux command line usage. 

## Install

On your fresh Ubuntu Linux installation:

Install git:

```shell
sudo apt -y install git
```

Depending on the Linux distribution this may require to install `make`

```shell
sudo apt install make
```

Clone the repository:

```shell
git clone https://github.com/qroques/dotfiles ~/dotfiles
```

```shell
cd ~/dotfiles
```

Magic install:

```shell
make install
```

## Credits

This is an adaptation of [lcouellan](https://github.com/lcouellan/) [dotfiles project](https://github.com/lcouellan/dotfiles)
