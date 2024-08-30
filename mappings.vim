nnoremap <C-f> :call CleanUpTheFile()<CR>

map <C-r> <ESC>:nohlsearch<CR> " reset search highlighting

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

nnoremap <C-w> :call AdvClose()<CR>

"map <F7> <ESC>:setlocal spell! spelllang=en_us<CR>
map <F7> <ESC>:setlocal spell! spelllang=de_de<CR>

"inoremap <Tab> <C-R>=SuperCleverTab()<cr>
inoremap <Tab> <C-N>
