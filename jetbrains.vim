" Overwrite some options from min.vim
set textwidth=115
set showmode
set which-key
set scrolloff=5

" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins
" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'

nmap <leader>tb <Action>(ToggleLineBreakpoint)
"[G]oto [D]eclaration
nmap <leader>gd <Action>(GotoDeclaration)
" [G]oto [F]ile"
nmap <leader>sf <Action>(GotoFile)
" [S]earch by [G]rep"
nmap <leader>sg <Action>(FindInPath)
" [C]lose [B]uffer"
nmap <leader>cb <Action>(CloseContent)
"[R]un [N]ormal
map <leader>rn <Action>(Run)
"[R]un [D]ebug
nmap <leader>rd <Action>(Debug)
nmap <leader>cc <Action>(CommentByLineComment)
