let g:nvim_base_path='~/.config/nvim/'

function! LoadFile(files)
    execute 'source' . g:nvim_base_path . a:files
endfunction


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ==============================================================================
" Git
" ==============================================================================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'mhinz/vim-signify'

" ==============================================================================
" Setup
" ==============================================================================
" Plug 'tpope/vim-sensible'
" Plug 'jeffkreeftmeijer/neovim-sensible'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ==============================================================================
" Editing
" ==============================================================================
Plug 'SirVer/ultisnips'                           " Track the engine.
Plug 'honza/vim-snippets'                         " Snippets are separated from the engine. Add this if you want them:
Plug 'preservim/nerdcommenter'                    " For commenting purpose
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'                            " Completion using emmet
Plug 'godlygeek/tabular'                          " indent the code
Plug 'AndrewRadev/tagalong.vim'                   " Change the html tag for both end
Plug 'lambdalisue/suda.vim'                       " Suda write
Plug 'vim-scripts/BufOnly.vim'                    " Close otjer buffer
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" ==============================================================================
" File modification
" ==============================================================================
Plug 'tpope/vim-eunuch' " To rename, move, unlink, mkdir, chmod, sudoedit,

" ==============================================================================
" PHP and Laravel
" ==============================================================================
Plug 'tpope/vim-dispatch'         " Optional
Plug 'tpope/vim-projectionist'    " Projection nist  like Econtroller
Plug 'noahfrederick/vim-composer' " Ecomposer
Plug 'noahfrederick/vim-laravel'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'vim-test/vim-test'

" For coc phpactor double dollar
" ==============================================================================
" Documentation
" ==============================================================================
Plug 'tobyS/vmustache' " Needed by pdv
Plug 'tobyS/pdv'
Plug 'Rican7/php-doc-modded'

" ==============================================================================
" Searching
" ==============================================================================
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'

" ==============================================================================
" Navigation
" ==============================================================================
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'    " move cursor
Plug 'adelarsq/vim-matchit'         " improve the power of %
Plug 'kshenoy/vim-signature'        " marking the line
Plug 'ludovicchabant/vim-gutentags' " Auto generate tags file
Plug 'majutsushi/tagbar'
Plug 'kshenoy/vim-signature'        " marking the line
Plug 'Valloric/MatchTagAlways'

" ==============================================================================
" Visual Vim
" ==============================================================================
" Plug 'mhinz/vim-startify'
Plug 'flazz/vim-colorschemes' " Color theme for the vim
" Plug 'itchyny/lightline.vim'  " For lightline
" Plug 'rbong/vim-crystalline'
Plug 'vim-airline/vim-airline'                  " For the status line visual
Plug 'vim-airline/vim-airline-themes'
Plug 'ericbn/vim-relativize'  " Display number to jump or relative number from current line
Plug 'sheerun/vim-polyglot'   " Syntax highlighting for the vim
Plug 'ap/vim-css-color'       " Show the hex color
Plug 'ryanoasis/vim-devicons'                   " Show filetype icon on nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'              " Git plugin Tree navigation on the side
Plug 'vwxyutarooo/nerdtree-devicons-syntax'     " Color for the nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'markonm/traces.vim'                       " show preview of subtitue command

" ==============================================================================
" Other
" ==============================================================================
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'

" ==============================================================================
" Language Server
" ==============================================================================

" Initialize plugin system
call plug#end()

call LoadFile('./setting.vim')
call LoadFile('./mapping.vim')
call LoadFile('./plugin-setting.vim')

