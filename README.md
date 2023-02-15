.vim
====

My vim dot files. the `.vimrc` file is saved to [vimrc](https://github.com/sweintritt/.vim/blob/master/vimrc).

## About

### Installing

Just run the following commands via terminal to get perfectly set up:

```console
$ cd ~/
$ git clone --recursive https://github.com/sweintritt/.vim.git .vim
$ ln -sf $HOME/.vim/vimrc $HOME/.vimrc
$ cd $HOME/.vim
$ git submodule update --init
```

You will also want [Powerline Fonts](https://github.com/powerline/fonts).

### Pathogen

The vim dot files make use of the excellent [Pathogen](https://github.com/tpope/vim-pathogen) runtime path manager to install plugins and runtime files into their own private directiories.

## Contributing

### Using the `Makefile`

You can use the [`Makefile`](Makefile) to run a series of commands.

```console
$ make help
install                        Sets up symlink for user and root .vimrc for vim and neovim.
README.md                      Generates and updates plugin info in README.md.
remove-submodule               Removes a git submodule (ex MODULE=bundle/nginx.vim).
update-pathogen                Updates pathogen.
update-molokai                Updates the molokai theme.
update-plugins                 Updates all plugins.
update                         Updates pathogen and all plugins.
```

## Plugins Used
* [github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
* [github.com/kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
* [github.com/scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [github.com/chr4/nginx.vim](https://github.com/chr4/nginx.vim.git)
* [github.com/joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)
* [github.com/ervandew/supertab](https://github.com/ervandew/supertab)
* [github.com/vim-syntastic/syntastic](https://github.com/vim-syntastic/syntastic)
* [github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline)
* [github.com/vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [github.com/ntpeters/vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace.git)
* [github.com/justmao945/vim-clang](https://github.com/justmao945/vim-clang)
* [github.com/tpope/vim-endwise](https://github.com/tpope/vim-endwise.git)
* [github.com/tpope/vim-five.git](https://github.com/tpope/vim-fugitive.git)
* [github.com/fatih/vim-go](https://github.com/fatih/vim-go.git)
* [github.com/elzr/vim-json](https://github.com/elzr/vim-json.git)
* [github.com/tpope/vim-surround](https://github.com/tpope/vim-surround.git)
* [github.com/liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key.git)
