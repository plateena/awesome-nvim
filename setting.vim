"""" Basic Behavior

set cursorline             "  Highlight current line
set number                 "  show line numbers
set wrap                   "  wrap lines
set encoding=utf-8         "  set encoding to UTF-8 (default was "latin1")
set mouse=a                "  enable mouse support (might not work well on Mac OS X)
set wildmenu               "  visual autocomplete for command menu
set wildmode=longest:full  "  visual autocomplete for command menu
set lazyredraw             "  redraw screen only when we need to
" set showmatch              "  highlight matching parentheses / brackets [{()}]
" set laststatus=2           "  always show statusline (even with only single window)
" set ruler                  "  show line and column number of the cursor on right side of statusline
set visualbell             "  blink cursor on error, instead of beeping
set ignorecase
set smartcase              "  Search is smart
set hlsearch            " highlight matches
set noswapfile             "  Disable vim swap file
set hidden                 "  Enable switch buffer without writing first
set spell                  "  Enable spell checking
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
set foldmethod=indent
" 
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better auto indent (e.g. add indent after '{')
" 
" 
" """" Miscellaneous settings that might be worth enabling
" 
set background=dark    " configure Vim to use brighter colors
set autoread           " auto reload the file in Vim if it has been changed outside of Vim
