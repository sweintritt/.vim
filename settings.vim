
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
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" If Linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

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
    "colorscheme onedark
    colorscheme PaperColor
catch
    try
        colorscheme molokai
    catch
        silent! colorscheme retrobox
    endtry
endtry
