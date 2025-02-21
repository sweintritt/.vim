" Minimal vim configuration without any plugins to be easily copied around on servers

set nocompatible     " be iMproved
filetype off         " required for Vundle
let mapleader = " "  " default is \
filetype plugin indent on    " required

function! AdvClose()
    :bp | sp | bn | bd
endfunction

function! OnModeChanged(mode)
    if (a:mode == 'i') " insert mode
        hi statusline guifg=gray10 guibg=PaleGreen ctermfg=118 ctermbg=235
    elseif (a:mode == 'r') " replace mode
        hi statusline guifg=gray100 guibg=firebrick1 ctermfg=160 ctermbg=255
    elseif (a:mode == 'n') " normal mode color
        hi statusline guifg=gray10 guibg=DeepSkyBlue ctermfg=39 ctermbg=233
    end
endfunction

" Basic statusline
function! SetupBaseline()
    au InsertEnter * call OnModeChanged('i')
    au InsertChange * call OnModeChanged(v:insertmode)
    au InsertLeave * call OnModeChanged('n')
    call OnModeChanged('n')  " default the statusline when entering vim

    set wildmenu                       " show suggestions in commandline on tab
    set wildignore+=*.o,*.obj,*~,*.swp,*.class    " ignore these files in the wildmenu
    set laststatus=2                   " always show the status line
    set statusline=                    " Remove all settings
    " left
    set statusline+=#%n:               " show buffer number
    set statusline+=%F                 " full path and filename
    set statusline+=%m                 " Modified flag [+]
    set statusline+=%r                 " Readonly flag
    set statusline+=%h                 " Help buffer flag
    set statusline+=%w                 " window preview flag
    set statusline+=%=                 " separator for left and right options
    " right
    set statusline+=\ %Y               " filetype
    set statusline+=\ \|\ %{&fenc}     " file encoding
    set statusline+=\ \|\ %{&ff}       " file format
    set statusline+=\ \|\ %3p%%        " percentage through file
    set statusline+=\ \|\ %7(%l:%c%)\  " show line and column, length 10
endfunction

syntax on                  " activate syntaxhighlighting
set t_Co=256               " use 256 colors
set nofoldenable           " disable folding
set colorcolumn=85         " show ruler on the right side
set number                 " show line numbers
set noerrorbells           " No beeps
set novisualbell           " No beeps
set encoding=utf-8         " set encoding
set termencoding=utf-8     " set terminal encoding
set relativenumber         " Relative line numbers for easier jumps
set lazyredraw             " activate lazy redraw
set ttyfast
set autowrite              " When switching buffers save file automatically
set autoread               " reload buffers on external changes
set autoindent             " automatic intendation
set copyindent             " copy the previous indent
set tabstop=4              " set tab width to n spaces
set shiftwidth=4
set softtabstop=4
set expandtab              " use spaces instead of tabs
set history=250            " Sets how many lines of history VIM has to remember
set cryptmethod=blowfish   " set default encryption method
set pumheight=15           " Limit popup menu height
set nobackup               " no backups
set nowritebackup          " no backups
set noswapfile             " no swapfile
set expandtab
set title                  " change the terminal's title
" This line will make Vim set out tab characters, trailing whitespace and invisible spaces visually,
" and additionally use the # sign at the end of lines to mark lines that extend off-scree
set listchars=tab:>-,space:.,extends:#,nbsp:.
set list
" Make Vim to handle long lines nicely.
set textwidth=85
set wrap
set formatoptions=qrn1
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set hidden
set ruler                       " Show the cursor position all the time
set cursorline                  " highlight the current line
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ignorecase  " ignore case in search
set smartcase   " ... but not when search pattern contains upper case characters
set incsearch   " jump to search results on search
set hlsearch    " highlight found results
set noshowmode  " We show the mode with airline or lightline
set wildignore+=*/build/*,*/target/*,*.swp,*.zip,*.tar.xz,*.tar.xz,*.war

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If Linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

" Set the colorscheme if available
try
    colorscheme onedark
catch
    colorscheme slate
endtry

map <C-r> <ESC>:nohlsearch<CR> " reset search highlighting

" Switch between buffers
nnoremap <C-x> :call NextBuffer()<CR>
nnoremap <C-y> :call PreviousBuffer()<CR>

" Easy window navigation
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy movement in insert mode
inoremap <C-k> <C-o>k
inoremap <C-j> <C-o>j
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Easy help navigation
nnoremap <CR> <C-]> " Follow links
nnoremap <BS> <C-T> " Go back

" copy line to xterm clipboard
vmap <C-c> "+yi
" paste from xterm clipboard
nmap <C-v> <ESC>"+p
vmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa

" faster saving
" TODO Nor working
nmap <leader>w :w!<cr>

" delete current line
nnoremap <C-d> dd

" move line up
nnoremap <C-S-k> :m .-2<CR>
nnoremap <C-S-j> :m .+1<CR>

" don't jump over split lines
nnoremap j gj
nnoremap k gk

nnoremap <C-w> :call AdvClose()<CR>
