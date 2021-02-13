let mapleader=" "
" map escape 
imap jk <Esc>

nmap j gj
nmap k gk

nmap <leader>w :w<Cr>

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

nmap <leader>sv :so ~/.config/nvim/init.vim<Cr> 

nmap <leader>bd :bd<Cr>
nmap <leader>bda :bufdo bd<Cr>

" Terminal movement
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap gp :silent %!prettier --stdin-filepath %<CR>
