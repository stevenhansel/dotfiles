# dotfiles

Steven's personal dotfiles, tailored for Linux with XMonad or MacOS

## Requirements

You'll need homebrew to install all the default packages, if you don't need the default casks and packages, then you'll only need GNU Stow to manage the dotfiles

- [Homebrew](https://brew.sh/)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Setupping up the dotfiles

1. Clone the repository into your `home` directory

The dotfiles folder must be located in the home directory, in order for `stow` to work later on.

```bash
git clone https://github.com/stevenhansel/dotfiles.git $HOME/.dotfiles
```

2. Install the default packages and casks in the `Brewfile`

Make sure that you're in the root directory of the repository.

```bash
cd $HOME/.dotfiles
brew bundle
```

3. `stow` all the configurations

```
stow vim
stow tmux
```
