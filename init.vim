" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' 

" Initialize plugin system
call plug#end()

let mapleader=" "
" map escape 
imap jk <Esc>

nmap j gj
nmap k gk

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

nmap <leader>sv :so ~/.config/nvim/init.vim<Cr> 

nmap <leader>bd :bd<Cr>
nmap <leader>bda :bufdo bd<Cr>
