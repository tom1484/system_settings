" Startup {{{
"
set nofoldenable
set autoread

" }}}

" General {{{

set nocompatible
set nobackup
set noswapfile
set history=1024
set autochdir
set whichwrap=b,s,<,>,[,]
set nobomb
set clipboard=unnamed
set mouse=a
set foldmethod=indent
set conceallevel=1

" }}}

" Lang & Encoding {{{

let &t_TI=""
let &t_TE=""

" }}}

" GUI {{{

set cursorline
highlight cursorline ctermfg=NONE ctermbg=237 cterm=bold guifg=NONE guibg=NONE gui=bold

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set background=dark

set list lcs=tab:\|\ 

" }}}

" Format {{{

set autoindent
set smartindent
set tabstop=4
set noexpandtab
set shiftwidth=4
set softtabstop=4
syntax on

" }}}

" Keymap {{{

" page down/up
nnoremap <C-J> <C-F>
inoremap <C-J> <Esc><C-F>a
nnoremap <C-K> <C-B>
inoremap <C-K> <Esc><C-B>a

" saving
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>

" change pane
inoremap <C-W> <Esc><C-W>

" replace
nnoremap <C-R> :Far 
inoremap <C-R> <Esc>:Far 
vnoremap <C-R> :Far 

" find
nnoremap <C-F> :F 
inoremap <C-F> <Esc>:F 
vnoremap <C-R> :F

" undo/redo
nnoremap <C-Z> u
inoremap <C-Z> <Esc>ua
nnoremap <C-Y> <C-R>
inoremap <C-Y> <Esc><C-R>a

" copy/cut/paste
nnoremap <C-C> yy
inoremap <C-C> <Esc>yya
vnoremap <C-C> y

nnoremap <C-X> dd
inoremap <C-X> <Esc>dda
vnoremap <C-X> d

nnoremap <C-V> p
inoremap <C-V> <Esc>pa
vnoremap <C-V> p

" remove line
nnoremap <C-D> "_dd
inoremap <C-D> <Esc>"_dda
vnoremap <C-D> "_dd<Esc>

" tab manipulation
nnoremap <C-Q> :tabclose<CR>
inoremap <C-Q> <Esc>:tabclose<CR>
" nnoremap <C-Q> :q<CR>
" inoremap <C-Q> <Esc>:q<CR>

nnoremap <C-N> :tabn<CR>
inoremap <C-N> <Esc>:tabn<CR>

nnoremap <C-P> :tabp<CR>
inoremap <C-P> <Esc>:tabp<CR>

" auto comment
nnoremap <C-_> :Commentary<CR>j
inoremap <C-_> <Esc>:Commentary<CR>ja
vnoremap <C-_> :Commentary<CR>j

" use bash command
nnoremap <C-T> :!
inoremap <C-T> <Esc>:!
vnoremap <C-T> <Esc>:!

" toggle plugs
nnoremap <F3> :NERDTreeToggle<CR>
inoremap <F3> :NERDTreeToggle<CR>

nnoremap <F4> :TagbarToggle<CR>
inoremap <F4> :TagbarToggle<CR>

" }}}

" Plugin {{{

call plug#begin('~/.vim/bundle/')
	Plug 'fatih/vim-go'
	Plug 'nsf/gocode'
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'majutsushi/tagbar'
	Plug 'godlygeek/tabular'
	Plug 'kien/ctrlp.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'tpope/vim-commentary'
	Plug 'brooth/far.vim'
	Plug 'tmhedberg/matchit'
	Plug 'morhetz/gruvbox'
	Plug 'tmhedberg/simpylfold'
	" Plug 'nathanaelkane/vim-indent-guides'
	" Plug 'Yggdroot/indentLine'
call plug#end()

" COC.nvim {{{

let g:coc_global_extensions=[
	\ "coc-lists",
	\ "coc-vimlsp",
	\ "coc-python",
	\ "coc-ccls",
	\ "coc-tasks",
	\ "coc-json",
	\ "coc-vimtex",
	\ "coc-html",
	\ "coc-css",
	\ 'coc-snippets',
\ ]

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_snippet_next='<C-N>'
let g:coc_snippet_previous='<C-P>'

" }}}

" CtrlP {{{

let g:ctrlp_map='<leader>f'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=30
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" }}}

" Far.vim {{{

set lazyredraw
set regexpengine=1
set ignorecase smartcase

let g:far#enable_undo=1
let g:far#highlight_match=1

let g:far#window_layout='right'
let g:far#window_width=80
let g:far#preview_window_layout='bottom'

let g:far#auto_preview=1
let g:far#auto_preview_on_start=0

" }}}

" Gitgutterr {{{

let g:gitgutter_override_sign_column_highlight=0
highlight clear SignColumn

" }}}

" Airline {{{

let g:airline_theme='base16_gruvbox_dark_hard'

" }}}

" Gruvbox {{{

colorscheme gruvbox

" }}}

" vim-go {{{

let g:go_fmt_command="goimports"

" }}}

" NERDTree {{{

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
let NERDTreeChDirMode=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" }}}

" Tagbar {{{

let g:tagbar_width=28
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

" }}}

" }}}

" SimplyFold {{{

let g:SimpylFold_docstring_preview=1

" }}}
