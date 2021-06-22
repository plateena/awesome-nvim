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
" Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
" Plug 'mhinz/vim-signify' " show sign where the modify add del line at

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
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'                           " Track the engine.
Plug 'honza/vim-snippets'                         " Snippets are separated from the engine. Add this if you want them:
Plug 'preservim/nerdcommenter'                    " For commenting purpose
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'                            " Completion using emmet
Plug 'godlygeek/tabular'                          " indent the code
Plug 'AndrewRadev/tagalong.vim'                   " Change the html tag for both end
Plug 'lambdalisue/suda.vim'                       " Suda write
Plug 'vim-scripts/BufOnly.vim'                    " Close other buffer
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'wellle/targets.vim'                           " add more text object example delete around , da,
" Plug 'plasticboy/vim-markdown'
" Plug 'FooSoft/vim-argwrap'                          " wrap array, object online to multiple and vice versa
" Plug 'preservim/vim-wordy'                            " Check grammar and weak word
" Plug 'KabbAmine/vCoolor.vim'                        " color selecting in vim
" Plug 'amiorin/vim-project'

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
" Plug 'vim-test/vim-test'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

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
" Plug 'pechorin/any-jump.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'mileszs/ack.vim'

" ==============================================================================
" Navigation
" ==============================================================================
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'    " move cursor
Plug 'adelarsq/vim-matchit'         " improve the power of %
Plug 'kshenoy/vim-signature'        " marking the line
Plug 'ludovicchabant/vim-gutentags' " Auto generate tags file
Plug 'majutsushi/tagbar'
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
" Plug 'ap/vim-css-color'       " Show the hex color " having slow issue
" Plug 'chrisbra/Colorizer'       " Show the color of code are incorrect
" Plug 'gko/vim-coloresque'
Plug 'etdev/vim-hexcolor'
Plug 'ryanoasis/vim-devicons'                   " Show filetype icon on nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'              " Git plugin Tree navigation on the side
Plug 'vwxyutarooo/nerdtree-devicons-syntax'     " Color for the nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'markonm/traces.vim'                       " show preview of subtitue command
Plug 'mrk21/yaml-vim' 
" Plug 'Yggdroot/indentLine'                      " Show the indent line
Plug 'nathanaelkane/vim-indent-guides'
" ==============================================================================
" Other
" ==============================================================================
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-repeat'
" Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'danilamihailov/vim-tips-wiki'
Plug 'mattn/calendar-vim'
Plug 'takac/vim-hardtime'
Plug 'tools-life/taskwiki'
" Plug 'blindFS/vim-taskwarrior'
" Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'farconics/victionary'         " search word definition

" ==============================================================================
" Colors
" ==============================================================================
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'gosukiwi/vim-atom-dark'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" Initialize plugin system
call plug#end()

call LoadFile('./setting.vim')
call LoadFile('./mapping.vim')
call LoadFile('./plugin-setting.vim')

