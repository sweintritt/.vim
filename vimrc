
set nocompatible              " be iMproved, required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'joshdick/onedark.vim'
"Plugin 'kien/ctrlp.vim'
"Plugin 'fatih/vim-go'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'tomasr/molokai'
"Plugin 'tpope/vim-commentary'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'ycm-core/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax on                  " activate syntaxhighlighting
set t_Co=256               " use 256 colors
set nofoldenable           " disable folding
set colorcolumn=85         " show ruler on the right side
set number                 " show line numbers
set noerrorbells           " No beeps
set novisualbell           " No beeps
set encoding=utf-8         " set encoding
set termencoding=utf-8     " set terminal encoding
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
"set showmatch              " show matching parenthesis
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
set wrap
set textwidth=85
set formatoptions=qrn1
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set laststatus=2
set hidden
set ruler                       " Show the cursor position all the time
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If Linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

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
    set wildignore=*.o,*.obj,*~,*.swp,*.class    " ignore these files in the wildmenu
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

"map <F7> <ESC>:setlocal spell! spelllang=en_us<CR>
map <F7> <ESC>:setlocal spell! spelllang=de_de<CR>

if has('gui_running')
    set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set guioptions-=M " remove the menu bar

    set guifont=Monospace\ 12
    set lines=38 columns=115
endif

" Set the colorscheme if available
try
    colorscheme onedark
catch
    try
        colorscheme molokai
    catch
        silent! colorscheme slate
    endtry
endtry

set cursorline                                   " highlight the current line
"hi CursorLine term=NONE cterm=NONE ctermbg=236   " style of the current line highlighting. must be after color scheme
"hi ColorColumn term=NONE cterm=NONE ctermbg=236  " style of the color column highlighting. must be after color scheme
" Easy readable highlighting of searchresults and spelling errors
hi Search guifg=Black guibg=cyan ctermfg=Black ctermbg=cyan
hi SpellBad guifg=Black guibg=Red ctermfg=Black ctermbg=Red

function! NextBuffer()
    if !exists("b:NERDTree")
        :bn
    endif
endfunction

function! PreviousBuffer()
    if !exists("b:NERDTree")
        :bp
    endif
endfunction

set ignorecase  " ignore case in search
set smartcase   " ... but not when search pattern contains upper case characters
set incsearch   " jump to search results on search
set hlsearch    " highlight found results
set noshowmode  " We show the mode with airline or lightline

map <C-r> <ESC>:nohlsearch<CR> " reset search highlighting

function! CleanUpTheFile()
    call feedkeys("gg=G")     " Fix indent
    call feedkeys("2\<C-o>")  " Jump back to steps in the jump list, which should bring you to where
                              " before the indent changes
    %s/\s\+$//e               " Remove trailing whitespaces
    %s/\r//ge                 " Remove Windows LineEndings
endfunction

nnoremap <C-f> :call CleanUpTheFile()<CR>

" Switch between buffers
nnoremap <C-A-PageDown> :call NextBuffer()<CR>
nnoremap <C-A-PageUp> :call PreviousBuffer()<CR>
nnoremap <C-x> :call NextBuffer()<CR>
nnoremap <C-y> :call PreviousBuffer()<CR>

" Easy window navigation
nnoremap <C-up> <C-w>k
nnoremap <C-down> <C-w>j
nnoremap <C-left> <C-w>h
nnoremap <C-right> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy help navigation
" follow links
nnoremap <CR> <C-]> " Follow links
nnoremap <BS> <C-T> " Go back

" copy line to xterm clipboard
vmap <C-c> "+yi
" paste from xterm clipboard
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" delete current line
nnoremap <C-d> dd
" move line up
nnoremap <A-up> :m .-2<CR>
nnoremap <A-k> :m .-2<CR>
" move line down
nnoremap <A-down> :m .+1<CR>
nnoremap <A-j> :m .+1<CR>

" don't jump over split lines
nnoremap j gj
nnoremap k gk
nnoremap <up> gk
nnoremap <down> gj

function! AdvClose()
    :bp | sp | bn | bd
endfunction

nnoremap <C-w> :call AdvClose()<CR>

try
    " configuration of airline
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline_theme='onedark'
    let g:airline#extensions#tabline#enabled = 1
    " Just show the filename (no path) in the tab
    let g:airline#extensions#tabline#fnamemod = ':t'
catch
    autocmd VimEnter * echom "airline is not installed"
    call SetupBaseline()
endtry

try
    let NERDTreeHighlightCursorline=1 " highlight the selected entry
    let NERDTreeMouseMode=2           " single click for folding, double for opening files
    "autocmd vimenter * NERDTree
catch
    autocmd VimEnter * echom "nerdtree is not installed"
endtry

" Add the current date as markdown headline for a new log entry
function! AddLogEntry()
    put =strftime('# %A %d.%m.%Y%n%n%n')
    let position = getpos(".")
    put _
    call setpos('.', position)
    execute "startinsert!"
endfunction

:command Log :call AddLogEntry()

" Syntax highlighting in markdown code fences
let g:markdown_fenced_languages = [ 'html', 'java', 'javascript', 'js=javascript', 'go', 'sh', 'bash=sh', 'css', 'sql' ]
" Search the pwd for the given string
:command -nargs=1 Sn !grep -Hn "<f-args" *

