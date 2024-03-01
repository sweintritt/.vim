
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

function! CleanUpTheFile()
    call feedkeys("gg=G")     " Fix indent
    call feedkeys("2\<C-o>")  " Jump back to steps in the jump list, which should bring you to where
                              " before the indent changes
    %s/\s\+$//e               " Remove trailing whitespaces
    %s/\r//ge                 " Remove Windows LineEndings
endfunction

" Add the current date as markdown headline for a new log entry
function! AddLogEntry()
    put =strftime('# %A %d.%m.%Y%n%n%n')
    let position = getpos(".")
    put _
    call setpos('.', position)
    execute "startinsert!"
endfunction
command Log :call AddLogEntry()

function! AdvClose()
    :bp | sp | bn | bd
endfunction


