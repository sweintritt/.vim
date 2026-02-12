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
nmap <leader>sf :FuzzyFiles<CR>
nmap <leader>s. :FuzzyMru<CR>
nmap <leader>sb :FuzzyBuffers<CR>
nmap <leader>sh :FuzzyHelp<CR>
nmap <leader>sg :FuzzyGrep<CR>

"nmap <leader>fc :FuzzyCommands<CR>
"nmap <leader>fi :FuzzyInBuffer<CR>
"nmap <leader>fp :FuzzyPrevious<CR>
"nmap <leader>fq :FuzzyQuickfix<CR>
"nmap <leader>fr :FuzzyMruCwd<CR>
nmap <leader> :WhichKey '<Space>'<CR>

" Easy exit for inser and visual mode
imap qq <ESC>
vmap qq <ESC>
