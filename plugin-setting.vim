" ==============================================================================
" NERDTree
" ==============================================================================
" nmap <C-n> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" ==============================================================================
" UltiSnips
" ==============================================================================
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/.vim/UltiSnips", $HOME."/.vim/plugged/vim-snippets/UltiSnips"]
let g:UltiSnipsSnippetsDir=$HOME."/.vim/UltiSnips"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<space><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<space><tab>"
let g:UltiSnipsJumpForwardTrigger="<C-n>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

let g:authors_name =  "star plateena"

" ==============================================================================
" FZF
" ==============================================================================
nmap <C-p> :FZF<Cr>
nmap <C-n> :Buffer<Cr>
nmap <C-h> :History:<Cr>
nmap <C-g> :GFiles<Cr>
nmap <C-f>h :History<Cr>
nmap <C-f>t :Tags<Cr>
nmap <C-f>l :Lines<Cr>
let g:fzf_layout = { 'up': '~60%' }

let g:fzf_action = {
    \ 'ctrl-q': 'wall | bdelete',
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" ==============================================================================
" Lightline
" ==============================================================================
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ==============================================================================
" Coc.vim
" ==============================================================================
"" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <expr> <Tab> pumvisible() ? "\<C-j>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-k>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()
" Use <c-space> to trigger completion.
"
if has('nvim')
  inoremap <silent><expr> <a-l> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-d>"
endif

" ==============================================================================
" Tagbar
" ==============================================================================
nmap ,t :TagbarToggle<Cr>

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components',
      \ ]}

let g:tagbar_type_typescript = {
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:class',
      \ 'n:namespace',
      \ 'f:function',
      \ 'G:generator',
      \ 'v:variable',
      \ 'm:method',
      \ 'p:property',
      \ 'i:interface',
      \ 'g:enum',
      \ 't:type',
      \ 'a:alias',
    \ ],
    \'sro': '.',
      \ 'kind2scope' : {
      \ 'c' : 'class',
      \ 'n' : 'namespace',
      \ 'i' : 'interface',
      \ 'f' : 'function',
      \ 'G' : 'generator',
      \ 'm' : 'method',
      \ 'p' : 'property',
      \},
  \ }

let g:tagbar_type_snippets = {
    \ 'ctagstype' : 'snippets',
    \ 'kinds' : [
        \ 's:snippets',
    \ ]
    \ }
" ==============================================================================
" PhpActor
" ==============================================================================
" Mapping phpactor
autocmd FileType php set iskeyword+=$
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'
autocmd FileType php nmap <buffer> <Leader>up :call phpactor#UseAdd()<CR>
autocmd FileType php nmap <buffer> <leader>mm :call phpactor#ContextMenu()<Cr>

" ==============================================================================
" Easymotion
" ==============================================================================
map <Leader>s <Plug>(easymotion-bd-f)
map <Leader>ww <Plug>(easymotion-bd-w)
map <leader>ss <Plug>(easymotion-s2)
map <leader>st <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" Vim-Test
"" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
autocmd FileType php nmap <buffer> <silent> t<C-n> :TestNearest<CR>
autocmd FileType php nmap <buffer> <silent> t<C-f> :TestFile<CR>
autocmd FileType php nmap <buffer> <silent> t<C-s> :TestSuite<CR>
autocmd FileType php nmap <buffer> <silent> t<C-l> :TestLast<CR>
autocmd FileType php nmap <buffer> <silent> t<C-g> :TestVisit<CR>

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"
" let test#strategy = "neovim"
let g:test#preserve_screen = 1
" :set splitright
" let test#neovim#term_position = "vsp 20"

" =============================================================================
" PhpDoc
" =============================================================================
autocmd FileType php nmap <buffer> <silent> d<C-d> :call PhpDocSingle()<Cr>

" After phpDoc standard
" let g:pdv_cfg_CommentHead = "/**"
" let g:pdv_cfg_Comment1 = " * "
" let g:pdv_cfg_Commentn = " * "
" let g:pdv_cfg_CommentBlank = " *"
" let g:pdv_cfg_CommentTail = " */"
" let g:pdv_cfg_CommentSingle = "//"
" let g:pdv_cfg_FuncCommentEnd = " // End function"
" let g:pdv_cfg_ClassCommentEnd = " // End"
let g:pdv_cfg_VariableTypeTag = "@var"

" Default values
let g:pdv_cfg_Type = "mixed"
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "plateena <plateena711@gmail.com>"
let g:pdv_cfg_Copyright = strftime('%Y') . " plateena"
" let g:pdv_cfg_License = "PHP Version 5.4 {@link http://www.php.net/license/}"

let g:pdv_cfg_ReturnVal = "void"

" Wether to create tags for class docs or not
let g:pdv_cfg_createClassTags = 1

" Wether to create @uses tags for implementation of interfaces and inheritance
let g:pdv_cfg_Uses = 1

" Options
" Whether or not to automatically add the function end comment (1|0)
let g:pdv_cfg_autoEndFunction = 1

" Whether or not to automatically add the class end comment (1|0)
let g:pdv_cfg_autoEndClass = 1

" :set paste before documenting (1|0)? Recommended.
let g:pdv_cfg_paste = 1

" Wether for PHP5 code PHP4 tags should be set, like @access,... (1|0)?
let g:pdv_cfg_php4always = 1

" Wether to guess scopes after PEAR coding standards:
" $_foo/_bar() == <private|protected> (1|0)?
let g:pdv_cfg_php4guess = 1

" If you selected 1 for the last value, this scope identifier will be used for
" the identifiers having an _ in the first place.
let g:pdv_cfg_php4guessval = "protected"

" Whether to generate the following annotations:
let g:pdv_cfg_annotation_Package = 0
let g:pdv_cfg_annotation_Version = 0
let g:pdv_cfg_annotation_Author = 1
let g:pdv_cfg_annotation_Copyright = 1
let g:pdv_cfg_annotation_License = 0

" =============================================================================
" Colorscheme
" =============================================================================
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
"good colorschemes: murphy, slate, molokai, badwolf, solarized, nord, one,
"oceanic, gruvbox, ayu, one, palenight, tender

" =============================================================================
"NERDCommenter
" =============================================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" =============================================================================
" Statusline
" =============================================================================
let g:airline_theme='ayu_mirage'
" let g:airline_theme='dracula'
" let g:airline_symbols = {}
" unicode symbols
"let g:airline_left_sep = '??'
"let g:airline_left_sep = '???'
"let g:airline_right_sep = '??'
"let g:airline_right_sep = '???'

" let g:airline_symbols.colnr = '  ???:'
let g:airline_symbols_crypt = '????'
let g:airline_symbols_linenr = '???'
let g:airline_symbols_linenr = '???'
let g:airline_symbols_linenr = '???'
let g:airline_symbols_linenr = '??'
let g:airline_symbols_maxlinenr = '???'
let g:airline_symbols_branch = '???'
let g:airline_symbols_paste = '??'
let g:airline_symbols_paste = '??'
let g:airline_symbols_paste = '???'
let g:airline_symbols_spell = '???'
let g:airline_symbols_notexists = '??'
let g:airline_symbols_whitespace = '??'

" powerline symbols
let g:airline_left_sep = '???'
let g:airline_left_alt_sep = '???'
let g:airline_right_sep = '???'
let g:airline_right_alt_sep = '???'
let g:airline_symbols_branch = '???'
let g:airline_symbols_readonly = '???'
let g:airline_symbols_linenr = '???'
let g:airline_symbols_maxlinenr = '???'
let g:airline_symbols_dirty='???'

let g:airline_filetype_overrides = {
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ }

" ==============================================================================
" MatchTag
" ==============================================================================
let g:mta_use_matchparen_group = 1
" let g:mta_set_default_matchtag_color = 1
let g:mta_filetypes = {
    \ 'vue' : 1,
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
"
" hi MatchParen cterm=bold ctermfg=8 ctermbg=8 guibg=None


" ==============================================================================
" Git
" ==============================================================================
nmap <leader>gs :Gstatus<Cr>

" ==============================================================================
" Vimwiki
" ==============================================================================
" Setting
let g:vimwiki_list = [{'path': '~/vimwiki/',  'syntax': 'markdown', 'ext': '.md'},
                        \ {'path': '~/vimwiki/work',  'syntax': 'markdown', 'ext': '.md'}]
"
" Makes vimwiki markdown link as [text](text.md)
let g:vimwiki_markdown_link_ext = 1

" Map
nmap ,wt <Plug>VimwikiIndex
nmap ,<space> <Plug>VimwikiToggleListItem

" Vimwiki diary
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" command to add template on vimwiki diary
" au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/bin/gen-vimwiki-diary-template '%'

" ==============================================================================
" TaskWiki
" ==============================================================================
let g:taskwiki_source_tw_colors='yes'
let g:taskwiki_disable_concealcursor='nc'

" ==============================================================================
" Relative
" ==============================================================================
set number relativenumber

" ==============================================================================
" Tagalong
" ==============================================================================
let g:tagalong_filetypes = ['html','vue','blade']

" ==============================================================================
" Projectionist
" ==============================================================================
if exists('g:loaded_vim_projectionist_elixir')
    finish
endif
let g:loaded_vim_projectionist_elixir = 1

let s:base_dir = resolve(expand("<sfile>:p:h"))
let s:proj_jsn = s:base_dir . "/projections.json"

function! s:setProjections()
    let l:json = readfile(s:proj_jsn)
    let g:my_projectionist = projectionist#json_parse(l:json)
    call projectionist#append(getcwd(), g:my_projectionist)
endfunction

autocmd User ProjectionistDetect :call s:setProjections()

" ==============================================================================
" Ack
" ==============================================================================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ==============================================================================
" vim-gutentags
" ==============================================================================
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]

" ==============================================================================
" Language server
" ==============================================================================
" let g:LanguageClient_serverCommands = {
"     \ 'vue': ['vls']
"     \ }

" ==============================================================================
" AnyJump
" ==============================================================================
let g:any_jump_disable_default_keybindings = 1

" ==============================================================================
" vim-hardtime
" ==============================================================================
" Enable vim-hardtime on every buffer
let g:hardtime_showmsg = 1
let g:hardtime_default_on = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_ignore_quickfix = 1
let g:hardtime_maxcount = 5
let g:hardtime_ignore_buffer_patterns = ["[Tt]agbar*", "NERD.*" ]
let g:hardtime_timeout = 700


" ==============================================================================
" Syntastic
" ==============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

