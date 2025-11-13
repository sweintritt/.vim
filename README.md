.vim
=====

My vim dot files. the '.vimrc' file is saved to [vimrc](https://github.com/sweintritt/.vim/blob/master/vimrc).

# Installation

Just run the following commands via terminal to get perfectly set up:

```console
$ cd ~/
$ git clone https://github.com/sweintritt/.vim.git .vim
$ cd .vim
make install
# Start vim and run :PluginInstall
```

You will also want [Powerline Fonts](https://github.com/powerline/fonts).

# The `Makefile`

The [`Makefile`](Makefile) gives you a few commands to help with the installation.

```console
make help
help            Shows the help text
install         Changes the .vimrc to source vimrc.vim. Any existing file will be stored as ~/.vimrc.old
install-vundle  Installs the Vundle plugin manager:
min.vim         Generates the min.vim configuration file
README.md       Generates the README.md file
```

# Used plugins

* [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)
* [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [girishji/vimcomplete](https://github.com/girishji/vimcomplete)
* [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
* [ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
* [preservim/nerdcommenter](https://github.com/preservim/nerdcommenter)
* [preservim/nerdtree](https://github.com/preservim/nerdtree)
* [ryanoasis/vim-devicons](https://github.com/ryanoasis/vim-devicons)
* [tpope/vim-dispatch](https://github.com/tpope/vim-dispatch)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

