""" SETTINGS FOR FILETYPES

autocmd filetype c source ~/.vim/iletype/c.vim
autocmd filetype cpp source ~/.vim/filetype/cpp.vim
autocmd filetype python source ~/.vim/filetype/python.vim
autocmd filetype go source ~/.vim/filetype/go.vim

""" FILE

syntax on
filetype plugin indent on 
set foldlevel=99

""" GENERAL

set nocompatible
set noshowcmd
set nobackup
set nobomb
set noswapfile

set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set clipboard=unnamed
set mouse=a
autocmd FileType * setlocal formatoptions-=cro
set autoread
autocmd CursorHold * checktime

silent !stty -ixon

set ttimeoutlen=0
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

set nolazyredraw
set ttyfast

""" LANG AND SETTINGS

let &t_TI=""
let &t_TE=""

""" GUI

set background=dark
set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold
hi Folded term=NONE cterm=NONE

set number norelativenumber

""" FORMAT

" set autoindent
" set smartindent
" set tabstop=4
" set noexpandtab
" set shiftwidth=4
" set softtabstop=4
" set list lcs=tab:\|\-
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

""" KEYMAP

" use shift+arrow
noremap <C-LEFT> <S-LEFT>
noremap <C-RIGHT> <S-RIGHT>

" delete previous word
inoremap <C-H> <C-W>

" page down/up
nnoremap <C-UP> 10k
inoremap <C-UP> <C-\><C-O>10k
vnoremap <C-UP> 10k
nnoremap <C-DOWN> 10j
inoremap <C-DOWN> <C-\><C-O>10j
vnoremap <C-DOWN> 10j

" saving
nnoremap <C-S> :w<CR>

" undo/redo
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

" copy/cut/paste/delete
nnoremap <C-C> yy
vnoremap <C-C> y

nnoremap <C-X> "0dd
vnoremap <C-X> "0d

nnoremap <C-V> "0p
" vnoremap <expr><C-V> 'pgv"'.v:register.'y`>'
vnoremap <C-V> "0p
inoremap <C-V> <C-R>0

nnoremap <C-D> dd
vnoremap <C-D> d

" use bash command
nnoremap <C-T> :!

" unmap <C-B> and <C-W>
nnoremap <C-A> <Nop>
nnoremap <C-W> <Nop>

" tab manipulation
nnoremap <C-A>l :tabs<CR>
nnoremap <C-A>q :q<CR>

nnoremap <C-A>n gt
nnoremap <C-A>p gT

nnoremap <C-A><UP> <C-W><UP>
nnoremap <C-A><DOWN> <C-W><DOWN>
nnoremap <C-A><LEFT> <C-W><LEFT>
nnoremap <C-A><RIGHT> <C-W><RIGHT>

nnoremap <C-A>c :tabe 
nnoremap <C-A>h :vsplit 
nnoremap <C-A>v :split 

" switch tab by numbers
nnoremap <C-A>1 1gt
nnoremap <C-A>2 2gt
nnoremap <C-A>3 3gt
nnoremap <C-A>4 4gt
nnoremap <C-A>5 5gt
nnoremap <C-A>6 6gt
nnoremap <C-A>7 7gt
nnoremap <C-A>8 8gt
nnoremap <C-A>9 9gt

""" PLUGINS

call plug#begin('~/.vim/autoload/')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
    Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

    Plug 'kien/ctrlp.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tmsvg/pear-tree'
    Plug 'tpope/vim-commentary'
    Plug 'brooth/far.vim'
    Plug 'tmhedberg/matchit'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'pseewald/vim-anyfold'
    Plug 'junegunn/vim-easy-align'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
call plug#end()

    """ Pear-tree

    " Default rules for matching:
    let g:pear_tree_pairs = {
                \ '(': {'closer': ')'},
                \ '[': {'closer': ']'},
                \ '{': {'closer': '}'},
                \ "'": {'closer': "'"},
                \ '"': {'closer': '"'}
                \ }
    " See pear-tree/after/ftplugin/ for filetype-specific matching rules

    " Pear Tree is enabled for all filetypes by default:
    let g:pear_tree_ft_disabled = []

    " Pair expansion is dot-repeatable by default:
    let g:pear_tree_repeatable_expand = 0

    " Smart pairs are disabled by default:
    let g:pear_tree_smart_openers = 1
    let g:pear_tree_smart_closers = 1
    let g:pear_tree_smart_backspace = 1

    " If enabled, smart pair functions timeout after 60ms:
    let g:pear_tree_timeout = 60

    " Automatically map <BS>, <CR>, and <Esc>
    let g:pear_tree_map_special_keys = 0

    " Default mappings:
    imap <BS> <Plug>(PearTreeBackspace)
    imap <CR> <Plug>(PearTreeExpand)
    " imap <Esc> <Plug>(PearTreeFinishExpansion)
    " Pear Tree also makes <Plug> mappings for each opening and closing string.
    "     :help <Plug>(PearTreeOpener)
    "     :help <Plug>(PearTreeCloser)
    
    " Not mapped by default:
    " <Plug>(PearTreeSpace)
    " <Plug>(PearTreeJump)
    " <Plug>(PearTreeExpandOne)
    " <Plug>(PearTreeJNR) 

    """ COC.nvim

    let g:coc_global_extensions=[
        \ "coc-lists",
        \ 'coc-snippets',
        \ "coc-prettier"
    \ ]

    inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

    let g:coc_snippet_next='<C-N>'
    let g:coc_snippet_previous='<C-P>'

        """ coc-go
        " autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

        """ coc-prettier
        command! -nargs=0 Prettier :CocCommand prettier.formatFile

    """ CtrlP

    let g:ctrlp_map='<leader>p'
    let g:ctrlp_working_path_mode=0
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_max_height=20
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_mruf_max=500
    let g:ctrlp_follow_symlinks=1

    let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<cr>'],
        \ }

    """ Far.vim

    " set lazyredraw
    set regexpengine=1
    " set ignorecase smartcase

    let g:far#enable_undo=1
    let g:far#highlight_match=1

    let g:far#window_layout='bottom'
    let g:far#window_height=20
    let g:far#preview_window_layout='bottom'
    let g:far#preview_window_height=8

    let g:far#auto_preview=1
    let g:far#auto_preview_on_start=0

    " replace
    nnoremap <C-R> :Far 
    vnoremap <C-R> :Far 

    " find
    nnoremap <C-F> :F 
    vnoremap <C-F> :F 

    """ Gitgutterr

    let g:gitgutter_override_sign_column_highlight=0
    highlight clear SignColumn

    """ Airline

    let g:airline_theme='base16_gruvbox_dark_hard'
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#enabled=1
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#formatter='unique_tail'

    """ Gruvbox

    colorscheme gruvbox

    """ vim-go

    let g:go_fmt_command="goimports"

    """ NERDTree

    let g:nerdtree_tabs_open_on_console_startup=0
    let NERDTreeWinPos='left'
    let NERDTreeWinSize=28
    let NERDTreeChDirMode=1
    let NERDTreeQuitOnOpen=1

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " toggle plugs
    nnoremap <silent><F1> :NERDTreeToggle<CR>
    nnoremap <silent><F2> :TagbarToggle<CR>

    """ Tagbar

    let g:tagbar_width=28
    let g:tagbar_autoclose=1
    let g:tagbar_autofocus=1

    let g:tagbar_type_go={
        \ 'ctagstype' : 'go',
        \ 'kinds' : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
    \ }

    """ FoldAny

    autocmd Filetype * AnyFoldActivate
    let g:anyfold_fold_comments=0

    """ EasyAlign

    " easy align
    nnoremap <C-E> :EasyAlign 
    vnoremap <C-E> :EasyAlign 

    """ Expand-region
    vmap = <Plug>(expand_region_expand)
    vmap - <Plug>(expand_region_shrink)

    """ Vim-commentary

    " auto comment
    nnoremap <silent><C-_> :Commentary<CR>
    vnoremap <silent><C-_> :Commentary<CR>

