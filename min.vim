
"----------------------------------------------------------------------------------
"- first.vim
"----------------------------------------------------------------------------------
set nocompatible     " be iMproved, required for Vundle
filetype off         " required for Vundle
let mapleader = " "  " default is \
"----------------------------------------------------------------------------------


"----------------------------------------------------------------------------------
"- functions.vim
"----------------------------------------------------------------------------------

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

" Add the current date as markdown headline for a new log entry
function! AddLogEntry()
    put = strftime('# %A %d.%m.%Y%n%n- %n**WRITE**%n')
    let position = getpos(".")
    put _
    normal! 2k
    execute "startinsert!"
endfunction

function! AdvClose()
    :bp | sp | bn | bd
endfunction
"----------------------------------------------------------------------------------


"----------------------------------------------------------------------------------
"- baseline.vim
"----------------------------------------------------------------------------------

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


"----------------------------------------------------------------------------------


"----------------------------------------------------------------------------------
"- settings.vim
"----------------------------------------------------------------------------------
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
"----------------------------------------------------------------------------------


"----------------------------------------------------------------------------------
"- mappings.vim
"----------------------------------------------------------------------------------
" [R]eset [S]earch highlighting
nmap <leader>rs <ESC>:nohlsearch<CR>
" [T]oggle [S]pellchecking
map <leader>ts <ESC>:setlocal spell! spelllang=de_de<CR>

" Switch between buffers
nmap H :call PreviousBuffer()<CR>
nmap L :call NextBuffer()<CR>

" Easy window navigation
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Easy movement in command-line mode
cmap <C-k> <Up>
cmap <C-j> <Down>
cmap <C-h> <Left>
cmap <C-l> <Right>

" Easy movement in insert mode
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>

" Easy help navigation
nmap <leader><CR> <C-]> " Follow links
nmap <leader><BS> <C-T> " Go back

" Copy/paste to/from clipboard
vmap <C-c> "+yi
nmap <C-v> <ESC>"+p
vmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa
" paste into command line
cmap <C-v> <C-r>+
cmap <leader>p <C-r>"

" move line up/down
nnoremap J :m .+1<CR>
nnoremap K :m .-2<CR>

" don't jump over split lines
nmap j gj
nmap k gk

" [C]lose [B]uffer
nmap <leader>cb :call AdvClose()<CR>
" [A]dd [l]og [e]ntry
nmap <leader>ale :call AddLogEntry()<cr>

" Save and quit shortcuts
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" Toggle file tree
nmap <leader>n :NERDTreeToggle<CR>

" Mappings like Telescope in neovim
nmap <leader>sf :CtrlP<CR>
nmap <leader>s. :CtrlPMRU<CR>
nmap <leader>sb :CtrlPBuffer<CR>

" Easy exit for inser and visual mode
imap jh <ESC>
vmap jh <ESC>
"----------------------------------------------------------------------------------


