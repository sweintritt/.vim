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

" delete current line
nnoremap <C-d> dd

" move line up
nnoremap <C-s-j> :m .+1<CR>
nnoremap <C-s-k> :m .-2<CR>

" don't jump over split lines
nnoremap j gj
nnoremap k gk

nnoremap <C-w> :call AdvClose()<CR>

map <F7> <ESC>:setlocal spell! spelllang=de_de<CR>

" Jump to next mark
nnoremap <C-m> ]'

nnoremap <leader>l :call AddLogEntry()<cr>

