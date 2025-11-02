" [R]eset [S]earch highlighting
nnoremap <leader>rs <ESC>:nohlsearch<CR>
" [T]oggle [S]pellchecking
map <leader>ts <ESC>:setlocal spell! spelllang=de_de<CR>

" Switch between buffers
nnoremap <C-x> :call NextBuffer()<CR>
nnoremap <C-y> :call PreviousBuffer()<CR>

" Easy window navigation
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Easy movement in command-line mode
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Easy movement in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Easy help navigation
nnoremap <leader><CR> <C-]> " Follow links
nnoremap <leader><BS> <C-T> " Go back

" Copy/paste to/from clipboard
vmap <C-c> "+yi
nmap <C-v> <ESC>"+p
vmap <C-v> <ESC>"+p
imap <C-v> <ESC>"+pa
" paste into command line
cnoremap <C-v> <C-r>+
cnoremap <leader>p <C-r>"

" move line up/down
nnoremap J :m .+1<CR>
nnoremap K :m .-2<CR>

" don't jump over split lines
nnoremap j gj
nnoremap k gk

" [C]lose [B]uffer
nnoremap <leader>cb :call AdvClose()<CR>
" [A]dd [l]og [e]ntry
nnoremap <leader>ale :call AddLogEntry()<cr>

" Save and quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Toggle file tree
nnoremap <leader>n :NERDTreeToggle<CR>

" TODO Add CtrlP mappings like Telescope in neovim

" Easy exit for inser and visual mode
inoremap jh <ESC>
vnoremap jh <ESC>
