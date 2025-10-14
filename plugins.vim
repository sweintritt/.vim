
set nocompatible     " be iMproved, required for Vundle
filetype off         " required for Vundle
let mapleader = " "  " default is \

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'girishji/vimcomplete'
Plugin 'joshdick/onedark.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required

try
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline_theme='onedark'
    let g:airline#extensions#tabline#enabled = 1
    " Just show the filename (no path) in the tab
    let g:airline#extensions#tabline#fnamemod = ':t'
catch
    "autocmd VimEnter * echom "airline is not installed"
    call SetupBaseline()
endtry

try
    let NERDTreeHighlightCursorline=1 " highlight the selected entry
    let NERDTreeMouseMode=2           " single click for folding, double for opening files
    "autocmd vimenter * NERDTree
catch
    "autocmd VimEnter * echom "nerdtree is not installed"
endtry
" Syntax highlighting in markdown code fences
let g:markdown_fenced_languages = [ 'html', 'java', 'javascript', 'js=javascript', 'go', 'sh', 'bash=sh', 'css', 'sql' ]

" Set the colorscheme if available
try
    colorscheme onedark
catch
    colorscheme slate
endtry

try
    let g:vimcomplete_tab_enable = 1
catch
    echom "vimcomplete is not installed"
endtry
