
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


