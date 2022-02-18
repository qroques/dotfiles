# .files

This repo is about my dotfiles. 

This is made for Ubuntu Linux distribution but it can be also used on other Unix based systems.

## Install

On your fresh Ubuntu Linux installation:

Install git:

```
sudo apt -y install git
```

Clone the repository:

```
git clone https://github.com/qroques/dotfiles ~/dotfiles
```

Magic install:

```
make install
```

## Credits

This is an adaptation of [lcouellan](https://github.com/lcouellan/) [dotfiles project](https://github.com/lcouellan/dotfiles)

```mermaid
classDiagram
    Group *-- User
    Group *-- Expense
    User ..> Expense
    Expense --* Category

    class Expense{
    -float amount
    -String name
    -String description
    -Date date
    -Obj User_payer
    -Obj User_beneficiary
    -Obj Category
    }
    class User{
    -String name
    -String email
    }
    class Group{
    -String name
    -String description
    -Array members
    }
    class Category{
    -String name
    }
```