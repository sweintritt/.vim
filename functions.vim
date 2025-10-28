
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
