"""" Basic Behavior

set path+=$PWD/**

" ignore those file
set wildignore+=**/UltiSnips/**
set wildignore+=**/tags
set wildignore+=**/node_modules/**
set wildignore+=**/vendor/**
set wildignore+=**/vendor/**
set wildignore+=**/__pycache__/**

set shada
set shadafile=/home/zack/.vim/shada

set cursorline            " Highlight current line
set encoding=utf-8        " set encoding to UTF-8 (default was                     " latin1 " )
set hidden                " Enable switch buffer without writing first
set hlsearch              " highlight matches
set ignorecase
set lazyredraw            " redraw screen only when we need to
set mouse=a               " enable mouse support (might not work well on Mac OS X)
set noswapfile            " Disable vim swap file
set number                " show line numbers
set smartcase             " Search is smart
set spell                 " Enable spell checking
set visualbell            " blink cursor on error, instead of beeping
set wildmenu              " visual autocomplete for command menu
set wildmode=longest:full " visual autocomplete for command menu
set wrap                  " wrap lines
set colorcolumn=80

" set showmatch              "  highlight matching parentheses / brackets [{()}]
" set laststatus=2           "  always show statusline (even with only single window)
" set ruler                  "  show line and column number of the cursor on right side of statusline
" save undo trees in files
set undofile
set undodir=/home/zack/.vim/undo

" no of undo saved
set undolevels=10000

" also use the os clipboard
" set clipboard+=unnamedplus
"
"
" 
" """" Vim Appearance
" 
" " put colorscheme files in ~/.vim/colors/
" colorscheme gruvbox      " good colorschemes: murphy, slate, molokai, badwolf, solarized
colo gruvbox
 
" " use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
" 
" 
" """" Tab settings
" 
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
" set foldmethod=indent
set nofoldenable
 
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better auto indent (e.g. add indent after '{')
" 
" 
" """" Miscellaneous settings that might be worth enabling
" 
set background=dark    " configure Vim to use brighter colors
set autoread           " auto reload the file in Vim if it has been changed outside of Vim

nnoremap gX :silent :execute
            \ "!xdg-open" expand('%:p:h') . "/" . expand("<cfile>") " &"<cr>

"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
